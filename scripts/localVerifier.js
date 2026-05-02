const fs = require("fs");

// Load disclosure
const disclosure = JSON.parse(
  fs.readFileSync("./data/disclosure.json", "utf8")
);

console.log("Loaded protocol:", disclosure.protocol);

// Simulated observed operations (later: real logs)
const observedOperations = [
  { operation: "PAUSE" },
  { operation: "UPGRADE" },
  { operation: "DRAIN_FUNDS" } // should fail
];

const declared = disclosure.controls.map(c => c.id);

console.log("\nDeclared controls:", declared);
console.log("\nObserved operations:");

observedOperations.forEach(op => {
  if (declared.includes(op.operation)) {
    console.log(`✅ ${op.operation} is DISCLOSED`);
  } else {
    console.log(`❌ ${op.operation} is NOT DISCLOSED`);
  }
});
