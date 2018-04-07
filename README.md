# ContractSwift  
Fully typed, autocompleted Ethereum Smart Contract in Swift

## Features  
- Generates `Contract.generated.swift` file from ABI
- All of your smart contract functions are fully typed and autocompleted
- Get `data` parameter string of transaction
- Multiple contracts are available

## Demo  
[![https://gyazo.com/db8016e36f65bccc1c54607112fc28ce](https://i.gyazo.com/db8016e36f65bccc1c54607112fc28ce.gif)](https://gyazo.com/db8016e36f65bccc1c54607112fc28ce)

**How to get transaction data parameter**:

```
    Contract
        .Abi1
        .Function
        .transfer(Address(string: "0x5c66b0d82df26e8FE165Be6628F5f5e1f1bccD5C"), BInt("100000000000000")!)
        .txDataString()

    // => 0xa9059cbb0000000000000000000000005c66b0d82df26e8FE165Be6628F5f5e1f1bccD5C00000000000000000000000000000000000000000000000000005af3107a4000
```

## Solidity type conversion  
Currently supports:  
- `bool` => `Bool`
- `int8<16,32,64,128,256>` => `BInt`
- `uint8<16,32,64,128,256>` => `BInt`
- `address` => `Address`
- `string` => `String`
- `bytes` => `Data`
- `bytes1<2,4,8,16,32>` => `Data`


## Installation  
Currently supports `CocoaPods`.  

Basically, `ContractSwift` needs `ABI` json files in specific directory.

```
- $SRCROOT
    - abi
        - Contract1.json
        - Contract2.json
        - ...
```

Name of json file will be its contract name in swift.  

```
struct Contract {
    struct Contract1 {
        ...
    }
}
// => Contract.Contract1.Function.transfer...
```

1. Add `pod 'ContractSwift'` to your Podfile and run `pod install`
2. Add a New Run Script Phase in Xcode.
3. Paste the folowwing script(first argument is an input directory, second is output):

```
"$PODS_ROOT/ContractSwift/contractswift" generate "$SRCROOT/abi" "$SRCROOT"
```

4. Build your project, then you'll see `Contract.generated.swift` file in the `$SRCROOT` directory.
5. Add `Contract.generated.swift` into your project.

## License  
ContractSwift is available under the MIT license. See the LICENSE file for more info.
