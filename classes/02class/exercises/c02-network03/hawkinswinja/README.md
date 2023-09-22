# c02-network03

## Commands Execution Output

- Commands for creating a new VPC:
```
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --instance-tenancy default --tag-specification 'ResourceType=vpc,Tags=[{Key=Name,Value=devopsacademy-vpc}]' --region ap-southeast-2
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-0bb99d8e60b8412e3",
        "State": "pending",
        "VpcId": "vpc-0c230225dbadb87a7",
        "OwnerId": "594524864098",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-0a61087ed1067a9e2",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false,
        "Tags": [
            {
                "Key": "Name",
                "Value": "devopsacademy-vpc"
            }
        ]
    }
}

```

- Any extra challenges faced?
None

<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network03](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network03/README.md)
