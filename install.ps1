function New-SymbolicLink
{
    param
    (
        [Parameter(Mandatory=$true)]
        $OriginalPath,

        [Parameter(Mandatory=$true)]
        $MirroredPath,

        [ValidateSet('File', 'Directory')]
        $Type='File'

    )
    
    if(!([bool]((whoami /groups) -match "S-1-16-12288") ))
    {
        Write-Warning 'Must be an admin'
        break
    }
    $signature = '
        [DllImport("kernel32.dll")]
        public static extern bool CreateSymbolicLink(string lpSymlinkFileName, string lpTargetFileName, int dwFlags);
        '
    Add-Type -MemberDefinition $signature -Name Creator -Namespace SymbolicLink 

    $Flags = [Int]($Type -eq 'Directory')
    [SymbolicLink.Creator]::CreateSymbolicLink($MirroredPath, $OriginalPath,$Flags)

}


#Unpack Submodules
git submodule update --init --recursive


#Link up files
$VFILESDIR = Convert-Path .

#Create vimrc in home folder which links to "proper" vimrc

$FILECONTENTS = "let `$MYVIMRC = $VFILESDIR/vimrc`r`n" +`
"source $VFILESDIR/vimrc"

new-item -path $HOME -name _vimrc -type "file" -value $FILECONTENTS  

#Symlink Vimfiles to home folder
New-SymbolicLink -OriginalPath $VFILESDIR/vim -MirroredPath $HOME/vimfiles -Type Directory 
