# c06-serverless01

## Creating a POST API using API Gateway, Lambda and DynamoDB

- [_provider.tf](_provider.tf)
- [main.tf](main.tf)
- [output.tf](output.tf)
- [Makefile](Makefile)
- [output.md](output.md)

## Command Execution Output
```sh
curl -H "X-api-key: <gateway-api-key>" -d '{"firstname":"value1","lastname":"value2","email":"value3"}' <api-gateway-output-url>
```
***
Answer for exercise [c06-serverless01](https://github.com/devopsacademyau/academy/blob/22bc97543c8193afc157cb3bc12e876d642c75ac/classes/06class/exercises/c06-serverless01/README.md)