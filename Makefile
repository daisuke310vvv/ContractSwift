TEMP_DIR=./tmp

build:
	swift build --disable-sandbox -c release -Xswiftc -static-stdlib

zip: build
	mkdir -p "$(TEMP_DIR)"
	cp -f ".build/release/ContractSwift" "$(TEMP_DIR)/contractswift"
	cp -rf "Sources/ContractSwiftCore" "$(TEMP_DIR)"
	cp -f "LICENSE" "$(TEMP_DIR)"
	(cd $(TEMP_DIR); zip -r - ContractSwiftCore LICENSE contractswift) > "./contractswift.zip"
	rm -r "$(TEMP_DIR)"
	
	
