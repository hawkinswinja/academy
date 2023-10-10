# C03-aws01

## Command Execution Output
- Commands used to create your autoscaling group:

lauch template config file: [asg-template.config](asg-template.config)

```
aws ec2 create-launch-template --launch-template-name asg1 \
> --launch-template-data file://asg-template.config

{
    "LaunchTemplate": {
        "LaunchTemplateId": "lt-0e875257a527eaa74",
        "LaunchTemplateName": "asg1",
        "CreateTime": "2023-10-10T14:33:57+00:00",
        "CreatedBy": "arn:aws:iam::594524864098:user/tilix",
        "DefaultVersionNumber": 1,
        "LatestVersionNumber": 1
    }
}

aws autoscaling create-auto-scaling-group --auto-scaling-group-name asg-servers
> --min-size 1 --max-size 2 --desired-capacity 2 \
> --launch-template LaunchTemplateId=lt-0e875257a527eaa74 \
> --vpc-zone-identifier "subnet-07cb35aa71579ff69,subnet-03368b62bf23efd78"
# no output on success
```

- Command used to get each asg instance hostname through the webserver
```
curl ec2-3-95-172-181.compute-1.amazonaws.com
ip-10-0-0-12.ec2.internal

curl ec2-3-81-30-213.compute-1.amazonaws.com
ip-10-0-0-23.ec2.internal
```

- Details of the security group used on the asg
```
{
    "SecurityGroups": [ 
        {
            "Description": "Allow http traffic",
            "GroupName": "asg-servers",
            "IpPermissions": [
                {
                    "FromPort": 80,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        { 
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 80,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "594524864098",
            "GroupId": "sg-0e699a0e9179886b8",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"    
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                    
                }
            ],
            "VpcId": "vpc-0dcceae9f02a49214"
            
        }
    ]
}
```

- what this line is doing? `curl https://169.254.169.254/latest/meta-data/hostname > index.html`
```
the line gets the internal dns hostname of the servers as stored in aws metadata.
The ip 169.254.169.254 is reserved by aws for metadata services. Ips in this range are reserved for aws use such as dns resolution and metadata
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws01](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws01/README.md)
