locals {
  cluster_ram_roles = [
    {
      role_name            = "AliyunCSDefaultRole"
      description          = "Default role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSDefaultRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedLogRole"
      description          = "Log role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedCsiRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedCsiRole"
      description          = "CSI role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedCsiRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedNetworkRole"
      description          = "Network role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedNetworkRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedKubernetesRole"
      description          = "Kubernetes role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedKubernetesRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSClusterRole"
      description          = "Kubernetes role for ACK"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSClusterRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunESSRole"
      description          = "Used for auto-scaling"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunESSRolePolicy"
      ],
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedAutoScalerRole"
      description          = "Used for managed auto-scaling node pools"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedAutoScalerRolePolicy"
      ]
      additional_policy = null
    },
    {
      role_name            = "AliyunCSManagedNlcRole"
      description          = "Used for managed node pools"
      max_session_duration = 3600
      role_document        = <<EOL
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "cs.aliyuncs.com"
        ]
      }
    }
  ],
  "Version": "1"
}
EOL
      policy_attachments = [
        "AliyunCSManagedNlcRolePolicy"
      ]
      additional_policy = null
    }
  ]
}
