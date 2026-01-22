
resource "aws_iam_user" "infra_user" {

  name = "infra-user"
}

resource "aws_iam_access_key" "infra_user_key" {
  user = aws_iam_user.infra_user.name
}


# Terraform Backend Access (S3)
########################################

data "aws_iam_policy_document" "tf_backend_s3" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.backend_s3}"]
  }
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = [
      "arn:aws:s3:::${var.backend_s3}/*"
    ]
  }
}

resource "aws_iam_policy" "tf_backend_s3" {
  name        = "${aws_iam_user.infra_user.name}-s3-backend-policy"
  policy      = data.aws_iam_policy_document.tf_backend_s3.json
  description = "Policy to allow S3 backend access for Terraform"
}
resource "aws_iam_user_policy_attachment" "tf_backend_s3" {
  user       = aws_iam_user.infra_user.name
  policy_arn = aws_iam_policy.tf_backend_s3.arn
}
