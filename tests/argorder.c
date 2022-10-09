// Result: 234

int
f(int a, int b, int c)
{
	return a * 100 + b * 10 + c;
}

int
g(int a, int b, int c)
{
	return 0;
}

struct wrapper {
	int call(int, int, int);
};

int
main()
{
	wrapper fwrapper = new(wrapper), gwrapper = new(wrapper);
	fwrapper.call = f;
	gwrapper.call = g;
	wrapper wrappers[] = new(wrapper[3]);
	wrappers[0] = wrappers[2] = gwrapper;
	wrappers[1] = fwrapper;

	int x = 1;
	return (wrappers[x++].call)(x++, x++, x++);
}
