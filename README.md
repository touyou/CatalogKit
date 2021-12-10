# CatalogKit

UIカタログアプリを簡単に構築するサポートをするためのライブラリ
Previewで確認しながら開発しているものをチームに共有するなどの目的で利用してください

## Feature

- `PreviewSection`/`PreviewItem` ... カタログのセクションやアイテムを管理する構造体。`SomeView_Preview.previews`を渡して使ってください
- `PreviewAppMasterView` ... 上記構造体を受け取ってカタログアプリの`View`を作る

## Example

- AppLibrary/SampleComponent/CatalogView.swiftを参照してください
- Previewは`public`にしても他の場所から読み込めないようなので、コンポーネントライブラリ内で`View`を構築する方法を想定しています

## Licence
