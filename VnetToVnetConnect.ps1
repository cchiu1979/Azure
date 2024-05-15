<# 
  Author: Chi Chiu
  Date: 06/10/2022
  
.SYNOPSIS
Create a VNet to VNet Connection
.DESCRIPTION

.EXAMPLE
#>

#Variables US East
$RGCE = "USEASTBoston"
$LocationUSE = "USEAST"
$VnetUSE = "USEASTVnet"
$GWNameUSE = "USEASTGW"
$ConnectionName = "EastToCentral"

#Variables US Central
$RGC = "US_Central"
$LocationUSC = "centralus"
$VnetUSC = "USC_Vnet"
$GWNameUSC = "USCGW"

#Get both VPN Gateways
$vnetuse1 = Get-AzVirtualNetworkGateway -Name $GWNameUSE -ResourceGroupName $RGCE
$vnetusc1 = Get-AzVirtualNetworkGateway -Name $GWNameUSC -ResourceGroupName $RGC

#Connect US East to US Central
New-AzVirtualNetworkgatewayConnection -Name $ConnectionName -ResourceGroupName $RGCE `
-VirtualNetworkGateway1 $vnetuse1 -VirtualNetworkGateway2 $vnetusc1 -Location $LocationUSC `
-ConnectionType Vnet2Vnet -SharedKey 'Link123!'