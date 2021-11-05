####### VPC #######
resource "aws_vpc" "app_vpc" {
  cidr_block       = var.vpc_cidr
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.public_subnet_1}"
  availability_zone = "${var.az1}"

  tags = {
    Name = "app_vpc-public-subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.public_subnet_2}"
  availability_zone = "${var.az2}"

  tags = {
    Name = "app_vpc-public-subnet_2"
  }
}
resource "aws_subnet" "public_subnet_3" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.public_subnet_3}"
  availability_zone = "${var.az3}"

  tags = {
    Name = "app_vpc-public-subnet_3"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.private_subnet_1}"
  availability_zone = "${var.az1}"

  tags = {
    Name = "app_vpc-private-subnet_1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.private_subnet_2}"
  availability_zone = "${var.az2}"

  tags = {
    Name = "app_vpc-private-subnet_2"
  }
}
resource "aws_subnet" "private_subnet_3" {
  vpc_id     = "${aws_vpc.app_vpc.id}"
  cidr_block = "${var.private_subnet_3}"
  availability_zone = "${var.az3}"

  tags = {
    Name = "app_vpc-private-subnet_3"
  }
}

resource "aws_internet_gateway" "ad_igw" {
  vpc_id = "${aws_vpc.app_vpc.id}"

  tags = {
    Name = "ad_igw"
  }
}

resource "aws_route_table" "ad-vpc-rt" {
  vpc_id = "${aws_vpc.app_vpc.id}"

  tags = {
    Name = "ad-vpc-rt"
  }
}


resource "aws_route" "ad-vpc-r01" {
  route_table_id            = "${aws_route_table.ad-vpc-rt.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = "${aws_internet_gateway.ad_igw.id}"
  depends_on                = ["aws_route_table.ad-vpc-rt"]
}

resource "aws_route_table_association" "ad-rt-association-1" {
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt.id}"
}
resource "aws_route_table_association" "ad-rt-association-2" {
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt.id}"
}
resource "aws_route_table_association" "ad-rt-association-3" {
  subnet_id      = "${aws_subnet.public_subnet_3.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt.id}"
}

resource "aws_route_table" "ad-vpc-rt-pvt" {
  vpc_id = "${aws_vpc.app_vpc.id}"

  tags = {
    Name = "ad-vpc-rt-pvt"
  }
}

resource "aws_route_table_association" "ad-rt-pvt-association-1" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt-pvt.id}"
}
resource "aws_route_table_association" "ad-rt-pvt-association-2" {
  subnet_id      = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt-pvt.id}"
}
resource "aws_route_table_association" "ad-rt-pvt-association-3" {
  subnet_id      = "${aws_subnet.private_subnet_3.id}"
  route_table_id = "${aws_route_table.ad-vpc-rt-pvt.id}"
}
