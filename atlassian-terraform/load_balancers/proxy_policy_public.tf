resource "aws_proxy_protocol_policy" "rancher_public_pp" {
  load_balancer = "${aws_elb.rancher_public.name}"
  instance_ports = ["81"]
}
