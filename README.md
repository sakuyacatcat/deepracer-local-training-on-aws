# AWS EC2 上で Terraform を使ったインフラ管理

このリポジトリは、AWS EC2 上で Terraform を使用してインフラを管理するためのものです。モジュール構成になっており、ネットワーク、S3、IAM、EC2 インスタンスなどのリソースを Terraform で管理します。

## 前提条件

以下のツールがインストールされていることを確認してください。

- Terraform（バージョン 1.0 以上）
- AWS CLI（認証情報が設定されていること）
- EC2 インスタンスで適切な IAM ロールが付与されていること（`AmazonEC2FullAccess` や `AmazonS3FullAccess` など）

## 環境設定

`environments/dev` ディレクトリには、開発環境用の Terraform 設定ファイルが含まれています。必要に応じて、`prod` などのディレクトリを作成し、異なる環境の設定を追加できます。

## 使い方

### 初期化

Terraform を初期化するには、以下のコマンドを実行します。

```bash
make init
```

### プランの確認

Terraform プランを確認して、どのような変更が適用されるかを確認します。

```bash
make plan
```

### 適用

Terraform を実行して、リソースを作成・更新します。

```bash
make apply
```

### 破棄

作成したリソースをすべて削除するには、以下のコマンドを実行します。

```bash
make destroy
```

### コードのフォーマット

Terraform コードのフォーマットを確認します。

```bash
make fmt
```

フォーマットを修正するには、以下を実行します。

```bash
make fmt-fix
```

### 検証

Terraform コードを検証して、構文が正しいか確認します。

```bash
make validate
```

### 出力

Terraform の出力を確認するには、以下のコマンドを実行します。

```bash
make output
```

## ディレクトリ構成

```
.
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   ├── provider.tf
├── modules/
│   ├── ec2/
│   ├── iam/
│   ├── network/
│   └── s3/
├── Makefile
└── README.md
```

## 注意事項

- 実際にリソースを削除するときは慎重に操作してください。特に本番環境では、リソースの破棄が重大な影響を及ぼす可能性があります。
- `terraform apply` や `terraform destroy` を実行する前に、必ず `terraform plan` で変更内容を確認することをお勧めします。
