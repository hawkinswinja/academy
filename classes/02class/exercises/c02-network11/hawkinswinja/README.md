# c02-network11

## Commands Execution Output

For the exercises below, you should use all the custom created network resources. NOT THE DEFAULT ONES.

- Commands for launching an EC2 instance on public subnet with public SG attached

```
aws ec2 run-instances --image-id ami-096e26de561b3feb2 --instance-type t2.micro --key-name aws102 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=bastion}]' --subnet-id subnet-087448560f71a7f82 --security-group-ids sg-02c3981f0b20b3d8f --region ap-southeast-2 --associate-public-ip-address
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-096e26de561b3feb2",
            "InstanceId": "i-097f2cd420cd2a460",
            "InstanceType": "t2.micro",
            "KeyName": "aws102",
            "LaunchTime": "2023-09-22T13:02:30+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-2-185.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.2.185",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-087448560f71a7f82",
            "VpcId": "vpc-0b4f29ed84bdb6fd1",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "ed4dffbb-426a-4495-839d-3beeef326a56",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2023-09-22T13:02:30+00:00",
                        "AttachmentId": "eni-attach-08d454b148f1e3ada",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "public-sg",
                            "GroupId": "sg-02c3981f0b20b3d8f"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "02:7d:21:3f:f7:fb",
                    "NetworkInterfaceId": "eni-0bbf761c9b9b9ba12",
                    "OwnerId": "594524864098",
                    "PrivateIpAddress": "10.0.2.185",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateIpAddress": "10.0.2.185"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-087448560f71a7f82",
                    "VpcId": "vpc-0b4f29ed84bdb6fd1",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "public-sg",
                    "GroupId": "sg-02c3981f0b20b3d8f"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "bastion"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios"
        }
    ],
    "OwnerId": "594524864098",
    "ReservationId": "r-0f5b44b40182aff6a"
}
```

- Commands for launching an EC2 instance on private subnet using custom ENI and private SG attached

```
aws ec2 run-instances --image-id ami-096e26de561b3feb2 --instance-type t2.micro --key-name aws102 --network-interfaces '[{"DeviceIndex":0,"NetworkInterfaceId":"eni-0a59c518b03e83493"}]' --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=private1}]' --region ap-southeast-2
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-096e26de561b3feb2",
            "InstanceId": "i-0871fbb4a9490df30",
            "InstanceType": "t2.micro",
            "KeyName": "aws102",
            "LaunchTime": "2023-09-22T13:06:29+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "ap-southeast-2a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-10-0-1-10.ap-southeast-2.compute.internal",
            "PrivateIpAddress": "10.0.1.10",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0b60fb1c511169e96",
            "VpcId": "vpc-0b4f29ed84bdb6fd1",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "8a0824b7-7f4e-4533-9800-1f75e8de301c",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2023-09-22T13:06:29+00:00",
                        "AttachmentId": "eni-attach-00b0790f0f95ffd26",
                        "DeleteOnTermination": false,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "ap-southeast-2 eni",
                    "Groups": [
                        {
                            "GroupId": "sg-0e5279033ecea0fcb"
                        }
                    ],
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
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0b60fb1c511169e96",
                    "VpcId": "vpc-0b4f29ed84bdb6fd1",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupId": "sg-0e5279033ecea0fcb"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "private1"
                }
            ],
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "optional",
                "HttpPutResponseHopLimit": 1,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios"
        }
    ],
    "OwnerId": "594524864098",
    "ReservationId": "r-05f4c1a8856e30c27"
}
```

- Commands for accessing your public instance using ssh

```
ssh -A -i "aws102.pem" ec2-user@ec2-54-66-237-32.ap-southeast-2.compute.amazonaws.com
```

- Commands for accessing your private instance from public one

```
eval `ssh-agent`
ssh-add aws102.pem
ssh -i aws102.pem ec2-user@10.0.1.10
```

- Commands for testing ping to `8.8.8.8` from private instance

```
ping 8.8.8.8
```

- Any extra challenges faced?
    - port forwarding was a challenge


<!-- Don't change anything below this point-->
***
Answer for exercise [c02-network11](https://github.com/devopsacademyau/academy/blob/893381c6f0b69434d9e8597d3d4b1c17f9bc1371/classes/02class/exercises/c02-network11/README.md)