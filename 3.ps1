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



#### PART 3B ######



#array of arrays, first entry is file lines
$oxy=$lines,@(),@(),@(),@(),@(),@(),@(),@(),@(),@(),@(),@() #there must be an easier way

#index 0 is equal to all lines
# for each array of lines
for ($i=0;$i -lt 12; $i++) {
    $score=0    
    # work out most common digit in current array
    foreach ($line in $oxy[$i]) {
        $x=$line.toCharArray()       
        if ($x[$i] -eq "0") {
            $score -= 1
        }
        if ($x[$i] -eq "1") {
            $score += 1
        }
    }
    # for each line, work out if its digit is the most common, and add it to next array if so
    foreach ($line in $oxy[$i]) {
        $x=$line.toCharArray() 
        #copy the least common value strings (or copy all if there's only one left, as we are taking least common)
        if (($x[$i] -eq "0" -and $score -lt 0) -or ($x[$i] -eq "1" -and $score -ge 0)) {
            $oxy[$i+1]+=$line
        }
    }
    write-host "Size of list $($i+1) is $($oxy[$i+1].count)"
}
write-host "Oxygen: $($oxy[12])"
$oxygen = [Convert]::ToInt32($oxy[12],2)
write-host "Oxygen: $oxygen)"

### do it again for co2 but slightly different ###

#array of arrays, first entry is file lines.
$co2=$lines,@(),@(),@(),@(),@(),@(),@(),@(),@(),@(),@(),@() #there must be an easier way

#index 0 is equal to all lines
# for each array of lines
for ($i=0;$i -lt 12; $i++) {
    $score=0
    
    # work out most common digit in current array
    foreach ($line in $co2[$i]) {
        $x=$line.toCharArray()
        

        if ($x[$i] -eq "0") {
            $score -= 1
        }
        if ($x[$i] -eq "1") {
            $score += 1
        }
    }
    # for each line, work out if its digit is the most common, and add it to next array if so
    foreach ($line in $co2[$i]) {
        $x=$line.toCharArray() 
        #copy the least common value strings (or copy all if there's only one left, as we are taking least common)
        if (($x[$i] -eq "1" -and $score -lt 0) -or ($x[$i] -eq "0" -and $score -ge 0) -or $co2[$i].count -eq 1) {
            $co2[$i+1]+=$line
        }
    }
    write-host "Size of list $($i+1) is $($co2[$i+1].count)"
}
$co2[12]
write-host "CO2: $($co2[12])"
$carbondioxide = [Convert]::ToInt32($co2[12],2)
write-host "CO2: $($carbondioxide)"
$product=($oxygen * $carbondioxide)

write-host "part 3B: $product"
