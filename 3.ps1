[string[]]$lines = Get-Content -Path '3.txt'
$array=@(0) * 12
foreach ($line in $lines) {
    $x=$line.toCharArray()
    $i=0
    foreach ($char in $x) {
        if ($char -eq "0") {
            $array[$i] -= 1
        }
        if ($char -eq "1") {
            $array[$i] += 1
        }
        $i++
    }

}
$i=0
foreach ($digit in $array) {
    if ($digit -gt 0) {
        $array[$i] = 0
    } else {
        $array[$i] = 1
    }
    $i++
}
$gamma=0
for ($i=0;$i -lt 14;$i++) {
    $gamma += $array[$i] * [Math]::Pow(2,(11-$i))
}
$gamma

$array=@(0) * 12
foreach ($line in $lines) {
    $x=$line.toCharArray()
    $i=0
    foreach ($char in $x) {
        if ($char -eq "1") {
            $array[$i] -= 1
        }
        if ($char -eq "0") {
            $array[$i] += 1
        }
        $i++
    }

}
$i=0
foreach ($digit in $array) {
    if ($digit -gt 0) {
        $array[$i] = 0
    } else {
        $array[$i] = 1
    }
    $i++
}
$epsilon=0
for ($i=0;$i -lt 14;$i++) {
    $epsilon += $array[$i] * [Math]::Pow(2,(11-$i))
}
$epsilon
$product=($epsilon * $gamma)
write-host "part 3A: $product"

write-host "part 3B: $product"
