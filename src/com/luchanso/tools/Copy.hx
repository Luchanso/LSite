package com.luchanso.tools;
 
class Copy {	
	public static function clone<T>( v:T ) : T  { 
		if (!Reflect.isObject(v)) { // simple type 
			return v; 
		}
		else if (Std.is(v, String)) { // string
			return v;
		}
		else if(Std.is( v, Array )) { // array 
			var result = Type.createInstance(Type.getClass(v), []); 
			untyped { 
				for( ii in 0...v.length ) {
					result.push(clone(v[ii]));
				}
			} 
			return result;
		}
		else if(Std.is( v, List )) { // list
			//List would be copied just fine without this special case, but I want to avoid going recursive
			var result = Type.createInstance(Type.getClass(v), []);
			untyped {
				var iter : Iterator<Dynamic> = v.iterator();
				for( ii in iter ) {
					result.add(ii);
				}
			} 
			return result; 
		}
		else if(Type.getClass(v) == null) { // anonymous object 
			var obj : Dynamic = {}; 
			for( ff in Reflect.fields(v) ) { 
				Reflect.setField(obj, ff, clone(Reflect.field(v, ff))); 
			}
			return obj; 
		} 
		else { // class 
			var obj = Type.createEmptyInstance(Type.getClass(v)); 
			for(ff in Reflect.fields(v)) {
				Reflect.setField(obj, ff, clone(Reflect.field(v, ff))); 
			}
			return obj; 
		} 
		return null; 
	}
 
}