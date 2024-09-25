ENVIRONMENT ?= environments/dev
TERRAFORM_VERSION ?= 1.5.0

requirement-install:
	@if ! command -v tfenv >/dev/null 2>&1; then \
		echo "tfenvがインストールされていません。インストールを開始します。"; \
		git clone https://github.com/tfutils/tfenv.git ~/.tfenv; \
		echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile; \
		source ~/.bash_profile; \
		echo "tfenvをインストールしました。"; \
	else \
		echo "tfenvは既にインストールされています。"; \
	fi

install: requirement-install
	@echo "Terraformバージョン $(TERRAFORM_VERSION) をインストール中..."
	tfenv install $(TERRAFORM_VERSION)
	tfenv use $(TERRAFORM_VERSION)
	@echo "Terraformバージョン $(TERRAFORM_VERSION) の使用を開始しました。"

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
	terraform fmt -check

fmt-fix:
	terraform fmt

validate:
	cd $(ENVIRONMENT) && terraform validate

output:
	cd $(ENVIRONMENT) && terraform output

.PHONY: requirement-install install init plan apply destroy fmt fmt-fix validate output
