module tokenf

//to do
pub fn tokenizef(expr string) []int {
	mut res_val := []int
	mut a_int := 0
	mut b_int := 0
	splt := expr.split(' ')

	for s in splt {
		if s.ends_with('x') {
			//x_index := s.len - 1
			//a_index := x_index - 1

			//println(x_index)
			//println(a_index)

			a_val := s.trim('x')
			a_int = a_val.int()
			res_val << a_int
			//println(a_val)
			//println(a_int)
		}

		else if s.contains('+') {
			continue
		}
		else {
			b_val := s
			b_int = b_val.int()
			//println(b_int)
			res_val << b_int
		}
	}
	return res_val
}