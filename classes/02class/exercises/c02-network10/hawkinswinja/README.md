# c02-network10

## Commands Execution Output

- Commands for creating an ENI with an IP from your private subnet

```
aws ec2 create-network-interface --subnet-id subnet-0b60fb1c511169e96 --description 'ap-southeast-2 eni' --groups sg-0e5279033ecea0fcb --private-ip-address 10.0.1.10 --region ap-southeast-2
{
    "NetworkInterface": {
        "AvailabilityZone": "ap-southeast-2a",
        "Description": "ap-southeast-2 eni",
        "Groups": [
            {
                "GroupName": "private-sg",
                "GroupId": "sg-0e5279033ecea0fcb"
            }
        ],
        "InterfaceType": "interface",
        "Ipv6Addresses": [],
        "MacAddress": "02:01:ec:8a:16:71",
        "NetworkInterfaceId": "eni-0a59c518b03e83493",
        "OwnerId": "594524864098",
        "PrivateIpAddress": "10.0.1.10",
        "PrivateIpAddresses": [
            {
                "Primary": true,
                "PrivateIpAddress": "10.0.1.10"
            }
        ],
        "RequesterId": "AIDAYU3DRPZRAQHMVPDPH",
        "RequesterManaged": false,
        "SourceDestCheck": true,
        "Status": "pending",
        "SubnetId": "subnet-0b60fb1c511169e96",
        "TagSet": [],
        "VpcId": "vpc-0b4f29ed84bdb6fd1"
    }
}
```

- Any extra challenges faced? None


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network10](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network10/README.md)