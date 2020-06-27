resource "aws_s3_bucket" "application" {
  bucket = "terraform-application-${random_id.bucket.hex}"
}

resource "aws_s3_bucket_notification" "lambda" {
  bucket = aws_s3_bucket.application.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

