-include .env

help:
	@echo "Set environment variables in .env file as in .env.example"
	@echo "To Deploy, use: make deploy"

deploy:
	@forge script script/DeploySolveChallenge.s.sol --rpc-url $(ARB_RPC_URL) -vvvv --verify --etherscan-api-key $(ARBISCAN_API_KEY) --broadcast