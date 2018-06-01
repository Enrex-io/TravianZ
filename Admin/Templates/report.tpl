<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       report.tpl                                                     ##
##  Developed by:  Armando                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2014. All rights reserved.                ##
##                                                                             ##
#################################################################################
include_once("../GameEngine/Generator.php");
include_once("../GameEngine/Technology.php");
include_once("../GameEngine/Message.php");
if ($_GET['bid']) $rep = $database->getNotice2($_GET['bid']);
else
{
	$sql = "SELECT * FROM " . TB_PREFIX . "ndata ORDER BY time DESC ";
	$result = mysqli_query($GLOBALS["link"], $sql);
	$rep1 = $database->mysqli_fetch_all($result);
}

if($rep1)
{
	?>
	<link href="../<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7d" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7i" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>travian.css?e21d2" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>lang/en/lang.css?e21d2" rel="stylesheet" type="text/css">
	<h1>Reports</h1>
	<div id="content" class="reports" style="padding: 0;">
	<?php
		include("Notice/all.tpl");
	?>
	</div>
	<?php
}
elseif($rep)
{ 
?>
	<link href="../<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7d" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7i" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>travian.css?e21d2" rel="stylesheet" type="text/css">
	<link href="../<?php echo GP_LOCATE; ?>lang/en/lang.css?e21d2" rel="stylesheet" type="text/css">
	<br />
	<span class="b">Report of</span>: <?php echo $database->getUserField($rep['uid'],'username',0);?><br />

	<div id="content" class="reports">
		<h1>Report</h1>
<?php 
    $message = New Message();
	$type = $rep['ntype'];
	$message->readingNotice['data'] = $rep['data'];
	include ("../Templates/Notice/" . $message->getReportType($type) . ".tpl");
}
else echo "Report ID ".$_GET['bid']." doesn't exist!";
?>
