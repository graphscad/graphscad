pyinstaller graphscad.py --noconsole --onefile --distpath ../build/graphscad_ubu
cp  graphscadsettings ../build/graphscad_ubu/graphscadsettings -r
cp  examples_graphscad ../build/graphscad_ubu/examples_graphscad -r
cp  plugins ../build/graphscad_ubu/plugins -r
cp  icons ../build/graphscad_ubu/icons -r


