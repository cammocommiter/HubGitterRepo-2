for i in `gem list --no-versions`; do gem uninstall -aIx $i; done

h = {a: 1, b: 2, c: 3}
key_map = {a: 'A', b: 'B', c: 'C'}

h.transform_keys! {|k| key_map[k]}
# => {"A"=>1, "B"=>2, "C"=>3} 
