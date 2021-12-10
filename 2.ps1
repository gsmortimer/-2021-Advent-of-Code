[string[]]$lines = Get-Content -Path '2.txt'
$horizontal = 0
$depth = 0
foreach ($line in $lines) {
    $regex = "\w+ (\d+)"
    $value = ([regex]::match($line, $regex)).groups[1].value
    if ($line -match "^forward") {
        $horizontal += [int]$value   
    }
    if ($line -match "^down") {
        $depth += [int]$value   
    }
    if ($line -match "^up") {
        $depth -= [int]$value   
    }

}
$product=($horizontal*$depth)
write-host "part 2A: $product"

$horizontal = 0
$depth = 0
$aim = 0
foreach ($line in $lines) {
    $regex = "\w+ (\d+)"
    $value = ([regex]::match($line, $regex)).groups[1].value
    if ($line -match "^forward") {
        $horizontal += [int]$value   
        $depth += [int]$value*$aim 
    }
    if ($line -match "^down") {
        $aim += [int]$value   
    }
    if ($line -match "^up") {
        $aim -= [int]$value  
    }

}
$product=($horizontal*$depth)
write-host "part 2B: $product"
