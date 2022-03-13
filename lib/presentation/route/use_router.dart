part of router;

StackRouter useRouter() {
  final context = useContext();
  return AutoRouter.of(context);
}
