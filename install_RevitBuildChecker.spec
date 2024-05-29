# -*- mode: python ; coding: utf-8 -*-


a = Analysis(
    ['RevitBuildChecker\\install_RevitBuildChecker.py'],
    pathex=[],
    binaries=[],
    datas=[('RevitBuildChecker/install_RevitBuildChecker.py', '.')],
    hiddenimports=['requests', 'ipaddress'],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
    optimize=0,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='install_RevitBuildChecker',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
