const fs = require("fs");
const { Interface } = require("ethers");
const crypto = require("crypto");

// -------- ABI (kept for future compatibility) --------
const ABI = [
  "event OperationExecuted(address indexed caller, uint256 indexed id, string operation)"
];

const iface = new Interface(ABI);

// -------- LOAD + VALIDATE DISCLOSURE --------
const disclosureRaw = JSON.parse(
  fs.readFileSync("./data/disclosure.json", "utf8")
);

function validateDisclosure(d) {
  if (!d.protocol || typeof d.protocol !== "string") {
    throw new Error("Invalid disclosure: missing protocol");
  }

  if (!Array.isArray(d.controls)) {
    throw new Error("Invalid disclosure: controls must be array");
  }

  d.controls.forEach((c, i) => {
    if (!c.id || typeof c.id !== "string") {
      throw new Error(`Invalid control at index ${i}: missing id`);
    }
  });

  return d;
}

const disclosure = validateDisclosure(disclosureRaw);

// -------- LOAD LOGS --------
const logs = JSON.parse(
  fs.readFileSync("./data/logs.json", "utf8")
);

// -------- ROBUST DECODER --------
function decodeLog(log) {
  // 1. Try ABI decode
  try {
    const parsed = iface.parseLog(log);
    console.log("ABI DECODE:", parsed.args.operation);
    return parsed.args.operation;
  } catch (e) {
    // 2. Fallback decode (current working path)
    try {
      const raw = Buffer.from(log.data.slice(2), "hex").toString("utf8");
      const match = raw.match(/[A-Z_]+/);

      if (match) {
        console.log("FALLBACK DECODE:", match[0]);
        return match[0];
      }

      return null;
    } catch {
      return null;
    }
  }
}

// -------- EXTRACT OPERATIONS --------
const observedOperations = logs
  .map(decodeLog)
  .filter(op => op !== null);

const uniqueObserved = [...new Set(observedOperations)];

// -------- DECLARED --------
const declared = disclosure.controls.map(c => c.id);

// -------- HASHING --------
function hashObject(obj) {
  return crypto
    .createHash("sha256")
    .update(JSON.stringify(obj))
    .digest("hex");
}

console.log("\nDisclosure Hash:", hashObject(disclosure));
console.log("Logs Hash:       ", hashObject(logs));

// -------- REPORT --------
console.log("\n==============================");
console.log("   LOCAL VERIFICATION REPORT  ");
console.log("==============================\n");

// 1. Executed
uniqueObserved.forEach(op => {
  if (declared.includes(op)) {
    console.log(`✅ ${op} → DISCLOSED + EXECUTED`);
  } else {
    console.log(`❌ ${op} → EXECUTED BUT NOT DISCLOSED`);
  }
});

// 2. Declared but NOT executed
declared.forEach(op => {
  if (!uniqueObserved.includes(op)) {
    console.log(`ℹ️ ${op} → DISCLOSED BUT NOT EXECUTED`);
  }
});

console.log("\n==============================\n");
