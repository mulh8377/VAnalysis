module range

struct Range {
mut:
	a int		//beginning of range
	b int		//ending of range
}

pub fn initialize_range(A int, B int) Range {
	return Range{a: A, b: B} 
}

pub fn (r mut Range) set_range(A int, B int) {
	r.a = A
	r.b = B
}

pub fn (r Range) get_range() []int {
	mut range := []int
	range << r.a
	range << r. b
	return range
}