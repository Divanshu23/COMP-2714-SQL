<?php
$c = oci_connect('hr', 'hr', '//localhost/xe');
$s = oci_parse($c, "call myproc('mydata', :bv)");
$v = 456;
oci_bind_by_name($s, ":bv", $v);
oci_execute($s);
echo "Completed";
?>