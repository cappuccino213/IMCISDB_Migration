# -*- mode: python -*-

block_cipher = None


a = Analysis(['DBmigration.py'],
             pathex=['C:\\Users\\zhangyp\\AppData\\Local\\Programs\\Python\\Python36-32', 'E:\\python\\IMCISDB_Migration'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='DBmigration',
          debug=False,
          strip=False,
          upx=True,
          runtime_tmpdir=None,
          console=True , icon='DBmigration.ico')
