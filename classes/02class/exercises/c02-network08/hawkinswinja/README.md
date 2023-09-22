# c02-network08

## Commands Execution Output

- Answer the following questions
  - What is the difference between inbound x outbound?
    ```
    inbound refers to all traffic directed to the subnet while outbound are traffic leaving the subnet 
    ```
    
  - What is going to happen by default? Everything allowed or denied?
    ```
    By default the inbound and outbound rule allow everything for default NACL. However for custom NACL, everything is denied
    ```
    

- Commands for creating a NACL to block SSH connection comming from the network `172.16.200.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-09261f4453487716e --ingress --rule-number 90 --protocol tcp --port-range From=22,To=22 --cidr-block 172.16.200.0/24 --rule-action deny --region ap-southeast-2
```

- Commands for creating a NACL to block access from your network to an external network `180.200.50.0/24`?

```
aws ec2 create-network-acl-entry --network-acl-id acl-09261f4453487716e --egress --rule-number 90 --protocol tcp --port-range From=80,To=80  --cidr-block 180.200.50.0/24 --rule-action deny --region ap-southeast-2
```

- Any extra challenges faced?
None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network08](https://github.com/devopsacademyau/academy/blob/80a940b39bc3ae40378abe7af015cb3c207463f6/classes/02class/exercises/c02-network08/README.md)