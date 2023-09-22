# c02-network09

## Commands Execution Output

- Commands for creating security groups for below table

|Security Group Name|Rule|Type|Port Range|Source|Description
|---|---|---|---|---|---|
|public-sg|inbound|Custom TCP Rule|22|`<your-home-ip-address>`|SSH access from home to AWS|
|private-sg|inbound|Custom TCP Rule|22|`<public-sg-id>`|SSH access only from public instances on AWS|

```
aws ec2 create-security-group --group-name public-sg --description 'SSH access from home to AWS' --vpc-id vpc-0b4f29ed84bdb6fd1 \
> --region ap-southeast-2
{
    "GroupId": "sg-02c3981f0b20b3d8f"
}
aws ec2 create-security-group --group-name private-sg --description 'SSH access only from public instances on AWS' --vpc-id vpc-0b4f29ed84bdb6fd1 --region ap-southeast-2
{
    "GroupId": "sg-0e5279033ecea0fcb"
}
aws ec2 authorize-security-group-ingress --group-id sg-02c3981f0b20b3d8f --protocol tcp --port 22 --cidr 105.163.157.196/32 --region ap-southeast-2
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0071db14aba041a84",
            "GroupId": "sg-02c3981f0b20b3d8f",
            "GroupOwnerId": "594524864098",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "105.163.157.196/32"
        }
    ]
}
aws ec2 authorize-security-group-ingress --group-id sg-0e5279033ecea0fcb --protocol tcp --port 22 --source-group sg-02c3981f0b20b3d8f --region ap-southeast-2
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-0ff5e306597e9b2f0",
            "GroupId": "sg-0e5279033ecea0fcb",
            "GroupOwnerId": "594524864098",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "ReferencedGroupInfo": {
                "GroupId": "sg-02c3981f0b20b3d8f",
                "UserId": "594524864098"
            }
        }
    ]
}
```

- Any extra challenges faced? None


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network09](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network09/README.md)