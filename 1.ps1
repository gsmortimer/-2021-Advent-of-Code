[string[]]$lines = Get-Content -Path '1.txt'
$previous = 0
$count = 0
foreach ($line in $lines) {
    if ($line -gt $previous) {
        $count += 1       
    }
    $previous = $line
}
write-host "part 1A: $count"

$a=0
$b=0
$c=0
$count=0
for ($x=0;$x -lt ($lines.count - 3);$x++) {
    $a=[int]$lines[$x]   + [int]$lines[$x+1] + [int]$lines[$x+2]
    $b=[int]$lines[$x+1] + [int]$lines[$x+2] + [int]$lines[$x+3]
    if ($b -gt $a) {
        $count += 1       
    }
}
write-host "part 1B: $count"