# Buffer Underflow Monitor - Drosera Security Trap

## 🚨 Overview
A security monitoring trap deployed on Hoodi Testnet that simulates detecting critical liquidity drains in DeFi buffer contracts.

## ✅ Current Status
- **Active**: Yes
- **Network**: Hoodi Testnet
- **Monitoring**: Continuous
- **Trigger Condition**: Balance < 10,000 wei

## 📍 Contract Addresses
- **Trap Contract**: 0x880E1C0FC83A17017Ed3834D51dd034361A80ea7
- **Response Contract**: 0x1002e019E1b4601cd7bC8314128A4DF70110cEb0
- **Deployer**: 0x3538b96e3f6199Ba2a320F523f091c095616ccdf

## 🛠️ Quick Commands
```bash
# Test the trap
drosera dryrun

# Deploy to Drosera
DROSERA_PRIVATE_KEY=your_key drosera apply
