<?php
$c = oci_connect('hr', 'hr', '//localhost/xe');
$s = oci_parse($c, "begin :bv := myfunc('mydata', 123); end;");
oci_bind_by_name($s, ":bv", $v, 10);
oci_execute($s);
echo $v, "<br>\n";
echo "Completed";
?>