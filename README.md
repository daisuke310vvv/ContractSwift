# ContractSwift  
Fully typed, autocompleted Ethereum Smart Contract in Swift

## Features  
- Generates `Contract.generated.swift` file from ABI
- All of your smart contract functions are fully typed and autocompleted
- Get `data` parameter string of transaction

## Demo  
[![https://gyazo.com/f5b7cc83b81a310e0d7f90ceb9a3618d](https://i.gyazo.com/f5b7cc83b81a310e0d7f90ceb9a3618d.gif)](https://gyazo.com/f5b7cc83b81a310e0d7f90ceb9a3618d)

**How to get transaction data parameter**:

```
    Contract
        .Function
        .transfer(Address(string: "0x5c66b0d82df26e8FE165Be6628F5f5e1f1bccD5C"), BInt("100000000000000")!)
        .txDataString()

    // => 0xa9059cbb0000000000000000000000005c66b0d82df26e8FE165Be6628F5f5e1f1bccD5C00000000000000000000000000000000000000000000000000005af3107a4000
```

## Solidity type conversion  
Currently supports:  
- `address` => `Address`
- `uint256` => `BInt`


## Installation  
Currently supports `CocoaPods`.  
Basically, `ContractSwift` needs `ABI` json file, so put it into your `$SRCROOT` directory like `$SRCROOT/abi.json`  

1. Add `pod 'ContractSwift'` to yuor Podfile and run `pod install`
2. Add a New Run Script Phase in Xcode.
3. Paste the folowwing script:

```
"$PODS_ROOT/ContractSwift/contractswift" generate "$SRCROOT" "$SRCROOT/abi.json"
```

4. Build your project, then you'll see `Contract.generated.swift` file in the `$SRCROOT` directory.
5. Add `Contract.generated.swift` into your project.

## License  
ContractSwift is available under the MIT license. See the LICENSE file for more info.
