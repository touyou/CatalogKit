PRODUCT_NAME := CatalogKitSample

open:
	open ./${PRODUCT_NAME}.xcworkspace

figma-export:
	cd ./AppLibrary; \
	figma-export colors -i figma-export.yml; \
	figma-export icons -i figma-export.yml; \
	figma-export images -i figma-export.yml
