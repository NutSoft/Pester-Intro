BeforeAll { 
    . $PSScriptRoot/Get-Planet.ps1
}

Describe 'Get-Planet' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }

    It 'Earth is the 3rd planet in our solar system' {
        $allPlanets = Get-Planet
        $allPlanets[2].Name | Should -Be 'Earth'
    }

    It 'Pluto is no longer classified as a planet in our solar system' {
        $allPlanets = Get-Planet
        $plutos = $allPlanets | Where-Object Name -eq 'Pluto'
        $plutos.Count | Should -Be 0
    }

    It 'Planets have this order: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune' {
        $allPlanets = Get-Planet
        $planetsInOrder = $allPlanets.Name -join ', ' 
        $planetsInOrder | Should -Be 'Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune'
    } 
}