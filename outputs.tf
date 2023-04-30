output "elb_security_group" {
  value = aws_security_group.elb.id
}

output "VM_sec_group" {
  value = aws_security_group.VM_sec_grp.id
}
