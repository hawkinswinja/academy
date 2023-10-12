# c03-aws02

## Command Execution Output
- Command used to create the Application Load Balancer (ALB)
```
aws elbv2 create-load-balancer --name asg1-elb \
> --subnets subnet-07cb35aa71579ff69 subnet-03368b62bf23efd78
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:us-east-1:594524864098:loadbalancer/app/asg1-elb/615f0381aad0bb4e",
            "DNSName": "asg1-elb-419475270.us-east-1.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z35SXDOTRQ7X7K",
            "CreatedTime": "2023-10-12T19:51:31.600000+00:00",
            "LoadBalancerName": "asg1-elb",
            "Scheme": "internet-facing",
            "VpcId": "vpc-0dcceae9f02a49214",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "us-east-1a",
                    "SubnetId": "subnet-03368b62bf23efd78",
                    "LoadBalancerAddresses": []
                },
                {
                "ZoneName": "us-east-1b",
                "SubnetId": "subnet-07cb35aa71579ff69",
                "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-0e699a0e9179886b8"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}

# target group
aws elbv2 create-target-group --name my-targets --protocol HTTP --port 80 \
> --vpc-id vpc-0dcceae9f02a49214
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:594524864098:targetgroup/my-targets/3ecea9b53a765808",
            "TargetGroupName": "my-targets",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-0dcceae9f02a49214",
            "HealthCheckProtocol": "HTTP",
            "HealthCheckPort": "traffic-port",
            "HealthCheckEnabled": true,
            "HealthCheckIntervalSeconds": 30,
            "HealthCheckTimeoutSeconds": 5,
            "HealthyThresholdCount": 5,
            "UnhealthyThresholdCount": 2,
            "HealthCheckPath": "/",
            "Matcher": {
                "HttpCode": "200"
            },
            "TargetType": "instance",
            "ProtocolVersion": "HTTP1",
            "IpAddressType": "ipv4"
        }
    ]
}

# add instances in asg to target group. No output for success
aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:us-east-1:594524864098:targetgroup/my-targets/3ecea9b53a765808 \
> --targets Id=i-0c3092fc04cace2c2 Id=i-04080d7b72107edab

# create listener
aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:594524864098:loadbalancer/app/asg1-elb/615f0381aad0bb4e \
> --protocol HTTP --port 80  \
> --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:594524864098:targetgroup/my-targets/3ecea9b53a765808
{
    "Listeners": [
        {
            "ListenerArn":"arn:aws:elasticloadbalancing:us-east-1:594524864098:listener/app/asg1-elb/615f0381aad0bb4e/5a76dce16a1efe5d",
            "LoadBalancerArn":"arn:aws:elasticloadbalancing:us-east-1:594524864098:loadbalancer/app/asg1-elb/615f0381aad0bb4e",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "forward",
                    "TargetGroupArn":"arn:aws:elasticloadbalancing:us-east-1:594524864098:targetgroup/my-targets/3ecea9b53a765808",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:594524864098:targetgroup/my-targets/3ecea9b53a765808",
                                "Weight": 1
                            }
                        ],
                        "TargetGroupStickinessConfig": {
                            "Enabled": false
                        }
                    }
                }
            ]
        }
    ]
}
```

- Details of the security group used
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

Questions:
- Run a few times `curl <load-balancer-cname>` and explain what do you see?
```
The internal hostname ip changes between each of the registered instances with each request
```

<!-- Don't change anything below this point-->
***
Answer for exercise [c03-aws02](https://github.com/devopsacademyau/academy/blob/aa1f1af00809616bdc1f8ba1d333b897c331d632/classes/03class/exercises/c03-aws02/README.md)
