import org.keplerproject.luajava.*;

public class Hello{
	public static void main(String[] args){
		LuaState L = LuaStateFactory.newLuaState();
		L.openLibs(); 
		System.out.println("This is java call lua."); 
		// load the lua file
		L.LdoFile("res/p5_nested.lua"); 
}
}