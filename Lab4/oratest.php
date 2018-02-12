<?php

   $conn = oci_connect('hr', 'hr', '//localhost/xe');
   if (!$conn) {
      $e = oci_error();
      print htmlentities($e['message']);
      exit;
  }

  $query = 'SELECT * FROM employees';

  $sth = oci_parse($conn, $query);
  if (!$sth) {
     $e = oci_error($conn);
     print htmlentities($e['message']);
     exit;
  }
 
  $results = oci_execute($sth, OCI_DEFAULT);
  if (!$results) {
     $e = oci_error($sth);
     print htmlentities($e['message']);
     exit;
  }

  print '<table style="border: 1px solid gray;">';
  while ($row = oci_fetch_array($sth, OCI_RETURN_NULLS+OCI_ASSOC)) {
     print '<tr>';
     foreach ($row as $item) {
        print '<td style="border: 1px solid gray; padding:3px 5px 3px 5px;">'.
              ($item ? htmlentities($item) : '&nbsp;').'</td>';
     }
     print '</tr>';
  }
  print '</table>';
 
  oci_close($conn);

?>


