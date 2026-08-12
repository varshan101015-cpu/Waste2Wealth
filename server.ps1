$webRoot = $PSScriptRoot
$port = 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Server running at http://localhost:$port/"
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $path = $ctx.Request.Url.LocalPath.TrimStart('/')
  if ([string]::IsNullOrEmpty($path)) { $path = "index.html" }
  $fullPath = Join-Path $webRoot $path
  if (Test-Path $fullPath) {
    $ext = [System.IO.Path]::GetExtension($fullPath).ToLower()
    $mime = @{'.html'='text/html';'.css'='text/css';'.js'='application/javascript'}
    $ctx.Response.ContentType = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { 'text/html' }
    $bytes = [System.IO.File]::ReadAllBytes($fullPath)
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else {
    $ctx.Response.StatusCode = 404
  }
  $ctx.Response.Close()
}
$listener.Stop()
