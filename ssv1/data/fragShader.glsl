#ifdef GL_ES
precision mediump float;
#endif
 
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
uniform float u_spd;

vec2 mouse;

void main() {
    mouse = u_mouse/u_resolution.xy;

    gl_FragColor = vec4(
        mouse[1],  // R
        mouse[0],  // G
        0.0,  // B
        1.0); // A
}
// // Author @patriciogv ( patriciogonzalezvivo.com ) - 2015

// #ifdef GL_ES
// precision mediump float;
// #endif

// #define PI 3.14159265359
// #define TWO_PI 6.28318530718

// uniform vec2 u_resolution;
// uniform float u_time;

// float shape(vec2 st, int N){
//     st = st*2.-1.;
//     float a = atan(st.x,st.y)+PI;
//     float r = TWO_PI/float(N);
//     return cos(floor(.5+a/r)*r-a)*length(st);
// }

// float box(vec2 st, vec2 size){
//     return shape(st*size,4);
// }

// float hex(vec2 st, bool a, bool b, bool c, bool d, bool e, bool f){
//     st = st*vec2(2.,6.);

//     vec2 fpos = fract(st);
//     vec2 ipos = floor(st);

//     if (ipos.x == 1.0) fpos.x = 1.-fpos.x;
//     if (ipos.y < 1.0){
//         return a? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     } else if (ipos.y < 2.0){
//         return b? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     } else if (ipos.y < 3.0){
//         return c? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     } else if (ipos.y < 4.0){
//         return d? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     } else if (ipos.y < 5.0){
//         return e? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     } else if (ipos.y < 6.0){
//         return f? box(fpos-vec2(0.03,0.), vec2(1.)) : box(fpos, vec2(0.84,1.));
//     }
//     return 0.0;
// }

// float hex(vec2 st, float N){
//     bool b[6];
//     float remain = floor(mod(N,64.));
//     for(int i = 0; i < 6; i++){
//         b[i] = mod(remain,2.)==1.?true:false;
//         remain = ceil(remain/2.);
//     }
//     return hex(st,b[0],b[1],b[2],b[3],b[4],b[5]);
// }

// vec3 random3(vec3 c) {
//     float j = 4096.0*sin(dot(c,vec3(17.0, 59.4, 15.0)));
//     vec3 r;
//     r.z = fract(512.0*j);
//     j *= .125;
//     r.x = fract(512.0*j);
//     j *= .125;
//     r.y = fract(512.0*j);
//     return r-0.5;
// }

// const float F3 =  0.3333333;
// const float G3 =  0.1666667;
// float snoise(vec3 p) {

//     vec3 s = floor(p + dot(p, vec3(F3)));
//     vec3 x = p - s + dot(s, vec3(G3));

//     vec3 e = step(vec3(0.0), x - x.yzx);
//     vec3 i1 = e*(1.0 - e.zxy);
//     vec3 i2 = 1.0 - e.zxy*(1.0 - e);

//     vec3 x1 = x - i1 + G3;
//     vec3 x2 = x - i2 + 2.0*G3;
//     vec3 x3 = x - 1.0 + 3.0*G3;

//     vec4 w, d;

//     w.x = dot(x, x);
//     w.y = dot(x1, x1);
//     w.z = dot(x2, x2);
//     w.w = dot(x3, x3);

//     w = max(0.6 - w, 0.0);

//     d.x = dot(random3(s), x);
//     d.y = dot(random3(s + i1), x1);
//     d.z = dot(random3(s + i2), x2);
//     d.w = dot(random3(s + 1.0), x3);

//     w *= w;
//     w *= w;
//     d *= w;

//     return dot(d, vec4(52.0));
// }

// void main(){
// 	vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     st.y *= u_resolution.y/u_resolution.x;

//     float t = u_time*0.5;

//     float df = 1.0;
//     df = mix(hex(st,t),hex(st,t+1.),fract(t));
//     df += snoise(vec3(st*75.,t*0.1))*0.03;
// 	gl_FragColor = vec4(mix(vec3(0.),vec3(1.),step(0.7,df)),1.0);
// }

// ------

// // Author: Patricio Gonzalez Vivo
// // Title: NoisePulse

// #ifdef GL_ES
// precision mediump float;
// #endif

// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float u_time;

// float ripples(vec2 st, float t) {
//     vec2 cnt = st-.5;
//     float d = dot(cnt,cnt)*2.;
//     return max(sin(t-d*10.),0.0);
// }

// vec2 skew (vec2 st) {
//     vec2 r = vec2(1.1547*st.x);
//     r.y = st.y+0.5*r.x;
//     return r;
// }

// vec2 unskew (vec2 st) {
//     vec2 r = vec2(st.x/1.1547);
//     r.y = st.y-0.5*(r.x*1.1547);
//     return r;
// }


// vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
// vec2 mod289(vec2 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
// vec3 permute(vec3 x) { return mod289(((x*34.0)+1.0)*x); }

// float snoise(vec2 v) {
//     const vec4 C = vec4(0.211324865405187,  // (3.0-sqrt(3.0))/6.0
//                         0.366025403784439,  // 0.5*(sqrt(3.0)-1.0)
//                         -0.577350269189626,  // -1.0 + 2.0 * C.x
//                         0.024390243902439); // 1.0 / 41.0
//     vec2 i  = floor(v + dot(v, C.yy) );
//     vec2 x0 = v -   i + dot(i, C.xx);
//     vec2 i1;
//     i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
//     vec4 x12 = x0.xyxy + C.xxzz;
//     x12.xy -= i1;
//     i = mod289(i); // Avoid truncation effects in permutation
//     vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
//         + i.x + vec3(0.0, i1.x, 1.0 ));

//     vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
//     m = m*m ;
//     m = m*m ;
//     vec3 x = 2.0 * fract(p * C.www) - 1.0;
//     vec3 h = abs(x) - 0.5;
//     vec3 ox = floor(x + 0.5);
//     vec3 a0 = x - ox;
//     m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );
//     vec3 g;
//     g.x  = a0.x  * x0.x  + h.x  * x0.y;
//     g.yz = a0.yz * x12.xz + h.yz * x12.yw;
//     return 130.0 * dot(m, g);
// }

// void main() {
//     vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     st = (st-.5)*1.0+.5;
//     if (u_resolution.y > u_resolution.x ) {
//         st.y *= u_resolution.y/u_resolution.x;
//         st.y -= (u_resolution.y*.5-u_resolution.x*.5)/u_resolution.x;
//     } else {
//         st.x *= u_resolution.x/u_resolution.y;
//         st.x -= (u_resolution.x*.5-u_resolution.y*.5)/u_resolution.y;
//     }

//     float t = u_time*0.25;
//     float grid = 20.;
//     vec3 color = vec3(0.);
    
//     st *= grid;    
//     vec2 s = skew(st);
//     vec2 s_i = floor(s);
//     vec2 s_f = fract(s);
//     float td = step(s_f.x,s_f.y);

//     color += ripples(unskew(s_i+td)/grid,t*3.)-snoise(floor(s+td*5.)+t);
    
//     gl_FragColor = vec4(color,1.0);
// }

// // // Author @patriciogv - 2015
// // // Title: Ikeda Data Stream
 
// #ifdef GL_ES
// precision mediump float;
// #endif
 
// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float u_time;
// uniform float u_spd;
 
// float random (in float x) {
//     return fract(sin(x)*1e4);
// }
 
// float random (in vec2 st) { 
//     return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
// }
 
// float pattern(vec2 st, vec2 v, float t) {
//     vec2 p = floor(st+v);
//     return step(t, random(100.+p*.000001)+random(p.x)*0.5 );
// }
 
// void main() {
//     vec2 st = gl_FragCoord.xy/u_resolution.xy;
//     st.x *= u_resolution.x/u_resolution.y;
 
//     vec2 grid = vec2(100.0,50.);
//     st *= grid;
 
//     vec2 ipos = floor(st);  // integer
//     vec2 fpos = fract(st);  // fraction
 
//     //float spdfactor=u_mouse.y/u_resolution.y;
//     float spdfactor=u_spd;// does the same thing.
 
 
//     //vec2 vel = vec2(u_time*2.*max(grid.x,grid.y)); // time
//     vec2 vel = vec2(u_time*spdfactor*2.*max(grid.x,grid.y)); // time
//     //vec2 vel = vec2(2.*max(grid.x,grid.y));
//     //vel *= vec2(-1.,0.0) * random(1.0+ipos.y); // direction // Assign a random value base on the integer coord
//     //vel *= vec2(-1.,0.0) *random(1.0+ipos.y); // direction
 
//     vel *= vec2(-1.,0.0) * (ipos.y+1)/100; // direction    // Assign a random value base on the integer coord
 
 
//     //offset means shift the rgb  channels a bit.  
//     vec2 offset = vec2(0.6,0.); 
//     //vec2 offset = vec2(ipos.x,0.);//interesting effect but not what is wnated.
 
//     vec3 color = vec3(0.);
//     color.r = pattern(st+offset,vel,0.5+u_mouse.x/u_resolution.x);
//     color.g = pattern(st,vel,0.5+u_mouse.x/u_resolution.x);
//     color.b = pattern(st-offset,vel,0.5+u_mouse.x/u_resolution.x);
 
//     //color.r = pattern(st+offset,vel,u_time+0.5+u_mouse.x/u_resolution.x);
//     //color.g = pattern(st,vel,u_time+0.5+u_mouse.x/u_resolution.x);
//     //color.b = pattern(st-offset,vel,u_time+0.5+u_mouse.x/u_resolution.x);
 
//     // Margins
//     color *= step(0.5,fpos.y);
 
//     //gl_FragColor = vec4(1.0-color,1.0);
//     gl_FragColor = vec4(color,1.0);
// }
