ENVIRONMENT ?= environments/dev

# コマンドの定義
init:
	@echo "Terraformを初期化中..."
	cd $(ENVIRONMENT) && terraform init

plan:
	@echo "Terraformプランを確認中..."
	cd $(ENVIRONMENT) && terraform plan

apply:
	@echo "Terraformを適用中..."
	cd $(ENVIRONMENT) && terraform apply -auto-approve

destroy:
	@echo "Terraformによるリソースを削除中..."
	cd $(ENVIRONMENT) && terraform destroy -auto-approve

fmt:
	@echo "Terraformコードのフォーマットをチェック中..."
	terraform fmt -check

fmt-fix:
	@echo "Terraformコードをフォーマット中..."
	terraform fmt

validate:
	@echo "Terraform設定の検証中..."
	cd $(ENVIRONMENT) && terraform validate

output:
	@echo "Terraformの出力を表示中..."
	cd $(ENVIRONMENT) && terraform output

.PHONY: init plan apply destroy fmt fmt-fix validate output
