-----------------------------------------------------------------------------
-- Title           : Title
-----------------------------------------------------------------------------
-- Author          : Daniel Pelikan
-- Date Created    : xx-xx-2014
-----------------------------------------------------------------------------
-- Description     : Description
--							
--
-----------------------------------------------------------------------------
-- Copyright 2014. All rights reserved
-----------------------------------------------------------------------------
----dec2bin(typecast(int16(511*cos(x)),'uint16'))
----x=0:(2*pi)/256:2*pi

--SampleSize=1024;
--SampleRate=10e6;
--NBits=8;
--Amplitude=2^NBits/2-1;
--x=0:(2*pi)/SampleSize:2*pi-(2*pi)/SampleSize;
--%A=Amplitude*cos(x)+Amplitude*cos(5*x)+Amplitude*cos(10*x)+Amplitude*cos(15*x)+Amplitude*cos(20*x)+Amplitude*cos(25*x)+Amplitude*cos(30*x)+Amplitude*cos(35*x)+Amplitude*cos(40*x)+Amplitude*cos(45*x)+Amplitude*cos(50*x)+Amplitude*cos(55*x)+Amplitude*cos(60*x)+Amplitude*cos(65*x)+Amplitude*cos(70*x)+Amplitude*cos(75*x)+Amplitude*cos(80*x)+Amplitude*cos(85*x)+Amplitude*cos(90*x)+Amplitude*cos(95*x)+Amplitude*cos(100*x);
--
--A=Amplitude*cos(x);
--for j = 10:10:500;
--	A=A+Amplitude*cos(j*x);
--endfor
--
--norm=(max(A)+abs(min(A)))/255;
--
--A=A./norm;
--A=A.+abs(min(A));
--
--
--for j = 1:length(A);
--	A(j)=round(A(j));
--endfor
--
--
--
--figure(1)
--plot(x,A);
--
--figure(2)
--FFTSize=2048;
--FFT_Signal=fft(A,FFTSize);
--Real_Signal=FFT_Signal(1:FFTSize/2);
--plot(0:SampleRate/(FFTSize):(SampleRate/2)-1/FFTSize,abs(Real_Signal));
--for i=1:SampleSize
--printf ("%d	=>\"%s\",\n",i-1,dec2bin(typecast(int16(A(i)),'uint16'),NBits));
--endfor;

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity SignalFromLookUp is
 generic (
    CounterIncrease : integer := 1    
    );
	port 
	(
		clk		: in std_logic;
		reset	:	in	std_logic;
		wave_out : out std_logic_vector(7 downto 0)
	);

end entity;

architecture rtl of SignalFromLookUp is

--	signal tmp : std_logic := 0 ;
--	constant const    : std_logic_vector(3 downto 0) := "1000";


type mem_type is array (0 to 1023) of signed(7 downto 0);



signal SignalFromLookUp_array : mem_type :=
( 0	=>"01111111",
1	=>"00000011",
2	=>"00000000",
3	=>"00000011",
4	=>"00000000",
5	=>"00000011",
6	=>"00000000",
7	=>"00000011",
8	=>"00000000",
9	=>"00000011",
10	=>"00000000",
11	=>"00000011",
12	=>"00000000",
13	=>"00000011",
14	=>"00000000",
15	=>"00000011",
16	=>"00000000",
17	=>"00000011",
18	=>"00000000",
19	=>"00000011",
20	=>"00000000",
21	=>"00000011",
22	=>"00000000",
23	=>"00000011",
24	=>"00000000",
25	=>"00000011",
26	=>"00000000",
27	=>"00000011",
28	=>"00000000",
29	=>"00000011",
30	=>"00000000",
31	=>"00000011",
32	=>"00000000",
33	=>"00000011",
34	=>"00000000",
35	=>"00000011",
36	=>"00000000",
37	=>"00000011",
38	=>"00000000",
39	=>"00000011",
40	=>"00000000",
41	=>"00000010",
42	=>"00000000",
43	=>"00000010",
44	=>"00000000",
45	=>"00000010",
46	=>"00000000",
47	=>"00000010",
48	=>"00000000",
49	=>"00000010",
50	=>"00000000",
51	=>"00000010",
52	=>"00000000",
53	=>"00000010",
54	=>"00000000",
55	=>"00000010",
56	=>"00000000",
57	=>"00000010",
58	=>"00000000",
59	=>"00000010",
60	=>"00000000",
61	=>"00000010",
62	=>"00000000",
63	=>"00000010",
64	=>"00000001",
65	=>"00000010",
66	=>"00000001",
67	=>"00000001",
68	=>"00000001",
69	=>"00000001",
70	=>"00000001",
71	=>"00000001",
72	=>"00000001",
73	=>"00000001",
74	=>"00000001",
75	=>"00000001",
76	=>"00000001",
77	=>"00000001",
78	=>"00000001",
79	=>"00000000",
80	=>"00000010",
81	=>"00000000",
82	=>"00000010",
83	=>"00000000",
84	=>"00000010",
85	=>"00000000",
86	=>"00000010",
87	=>"11111111",
88	=>"00000011",
89	=>"11111111",
90	=>"00000011",
91	=>"11111110",
92	=>"00000100",
93	=>"11111110",
94	=>"00000101",
95	=>"11111100",
96	=>"00000110",
97	=>"11111010",
98	=>"00001001",
99	=>"11110110",
100	=>"00010000",
101	=>"11100110",
102	=>"01100001",
103	=>"01000010",
104	=>"11101000",
105	=>"00010000",
106	=>"11110110",
107	=>"00001010",
108	=>"11111001",
109	=>"00000111",
110	=>"11111011",
111	=>"00000101",
112	=>"11111100",
113	=>"00000101",
114	=>"11111101",
115	=>"00000100",
116	=>"11111110",
117	=>"00000011",
118	=>"11111110",
119	=>"00000011",
120	=>"11111110",
121	=>"00000011",
122	=>"11111111",
123	=>"00000010",
124	=>"11111111",
125	=>"00000010",
126	=>"11111111",
127	=>"00000010",
128	=>"11111111",
129	=>"00000010",
130	=>"11111111",
131	=>"00000001",
132	=>"00000000",
133	=>"00000001",
134	=>"00000000",
135	=>"00000001",
136	=>"00000000",
137	=>"00000001",
138	=>"00000000",
139	=>"00000001",
140	=>"00000000",
141	=>"00000001",
142	=>"00000000",
143	=>"00000001",
144	=>"00000000",
145	=>"00000000",
146	=>"00000000",
147	=>"00000000",
148	=>"00000000",
149	=>"00000000",
150	=>"00000000",
151	=>"00000000",
152	=>"00000001",
153	=>"00000000",
154	=>"00000001",
155	=>"00000000",
156	=>"00000001",
157	=>"00000000",
158	=>"00000001",
159	=>"11111111",
160	=>"00000001",
161	=>"11111111",
162	=>"00000001",
163	=>"11111111",
164	=>"00000001",
165	=>"11111111",
166	=>"00000001",
167	=>"11111111",
168	=>"00000001",
169	=>"11111111",
170	=>"00000001",
171	=>"11111111",
172	=>"00000001",
173	=>"11111111",
174	=>"00000001",
175	=>"11111110",
176	=>"00000001",
177	=>"11111110",
178	=>"00000010",
179	=>"11111110",
180	=>"00000010",
181	=>"11111110",
182	=>"00000010",
183	=>"11111110",
184	=>"00000010",
185	=>"11111110",
186	=>"00000010",
187	=>"11111101",
188	=>"00000010",
189	=>"11111101",
190	=>"00000010",
191	=>"11111101",
192	=>"00000011",
193	=>"11111101",
194	=>"00000011",
195	=>"11111100",
196	=>"00000100",
197	=>"11111011",
198	=>"00000100",
199	=>"11111010",
200	=>"00000110",
201	=>"11111000",
202	=>"00001001",
203	=>"11110001",
204	=>"00011111",
205	=>"01110101",
206	=>"11101101",
207	=>"00001001",
208	=>"11111001",
209	=>"00000100",
210	=>"11111100",
211	=>"00000010",
212	=>"11111110",
213	=>"00000001",
214	=>"11111110",
215	=>"00000000",
216	=>"11111111",
217	=>"00000000",
218	=>"11111111",
219	=>"11111111",
220	=>"11111111",
221	=>"11111111",
222	=>"00000000",
223	=>"11111111",
224	=>"00000000",
225	=>"11111111",
226	=>"00000000",
227	=>"11111111",
228	=>"00000000",
229	=>"11111110",
230	=>"00000000",
231	=>"11111110",
232	=>"00000000",
233	=>"11111110",
234	=>"00000000",
235	=>"11111110",
236	=>"00000000",
237	=>"11111110",
238	=>"00000000",
239	=>"11111110",
240	=>"00000000",
241	=>"11111110",
242	=>"00000000",
243	=>"11111110",
244	=>"00000000",
245	=>"11111110",
246	=>"00000000",
247	=>"11111110",
248	=>"00000000",
249	=>"11111110",
250	=>"00000000",
251	=>"11111110",
252	=>"00000000",
253	=>"11111110",
254	=>"00000000",
255	=>"11111110",
256	=>"00000000",
257	=>"11111101",
258	=>"00000000",
259	=>"11111101",
260	=>"00000000",
261	=>"11111101",
262	=>"00000000",
263	=>"11111101",
264	=>"00000000",
265	=>"11111101",
266	=>"00000000",
267	=>"11111101",
268	=>"00000000",
269	=>"11111101",
270	=>"00000000",
271	=>"11111101",
272	=>"00000000",
273	=>"11111101",
274	=>"00000000",
275	=>"11111101",
276	=>"11111111",
277	=>"11111101",
278	=>"11111111",
279	=>"11111110",
280	=>"11111111",
281	=>"11111110",
282	=>"11111111",
283	=>"11111110",
284	=>"11111111",
285	=>"11111110",
286	=>"11111111",
287	=>"11111110",
288	=>"11111111",
289	=>"11111110",
290	=>"11111111",
291	=>"11111110",
292	=>"11111110",
293	=>"11111110",
294	=>"11111110",
295	=>"11111111",
296	=>"11111110",
297	=>"11111111",
298	=>"11111101",
299	=>"11111111",
300	=>"11111100",
301	=>"00000000",
302	=>"11111011",
303	=>"00000010",
304	=>"11111000",
305	=>"00000111",
306	=>"11101100",
307	=>"01110100",
308	=>"00011101",
309	=>"11101111",
310	=>"00001000",
311	=>"11110110",
312	=>"00000100",
313	=>"11111000",
314	=>"00000011",
315	=>"11111010",
316	=>"00000010",
317	=>"11111010",
318	=>"00000001",
319	=>"11111011",
320	=>"00000001",
321	=>"11111011",
322	=>"00000000",
323	=>"11111011",
324	=>"00000000",
325	=>"11111011",
326	=>"00000000",
327	=>"11111100",
328	=>"00000000",
329	=>"11111100",
330	=>"00000000",
331	=>"11111100",
332	=>"11111111",
333	=>"11111100",
334	=>"11111111",
335	=>"11111100",
336	=>"11111111",
337	=>"11111100",
338	=>"11111111",
339	=>"11111100",
340	=>"11111111",
341	=>"11111100",
342	=>"11111111",
343	=>"11111100",
344	=>"11111111",
345	=>"11111100",
346	=>"11111110",
347	=>"11111100",
348	=>"11111110",
349	=>"11111101",
350	=>"11111110",
351	=>"11111101",
352	=>"11111110",
353	=>"11111101",
354	=>"11111110",
355	=>"11111101",
356	=>"11111110",
357	=>"11111101",
358	=>"11111110",
359	=>"11111101",
360	=>"11111110",
361	=>"11111101",
362	=>"11111101",
363	=>"11111101",
364	=>"11111101",
365	=>"11111101",
366	=>"11111101",
367	=>"11111101",
368	=>"11111101",
369	=>"11111101",
370	=>"11111101",
371	=>"11111101",
372	=>"11111101",
373	=>"11111110",
374	=>"11111101",
375	=>"11111110",
376	=>"11111100",
377	=>"11111110",
378	=>"11111100",
379	=>"11111110",
380	=>"11111100",
381	=>"11111110",
382	=>"11111100",
383	=>"11111110",
384	=>"11111100",
385	=>"11111110",
386	=>"11111100",
387	=>"11111111",
388	=>"11111011",
389	=>"11111111",
390	=>"11111011",
391	=>"11111111",
392	=>"11111011",
393	=>"11111111",
394	=>"11111010",
395	=>"00000000",
396	=>"11111010",
397	=>"00000000",
398	=>"11111001",
399	=>"00000001",
400	=>"11111001",
401	=>"00000010",
402	=>"11110111",
403	=>"00000011",
404	=>"11110110",
405	=>"00000110",
406	=>"11110010",
407	=>"00001100",
408	=>"11100100",
409	=>"00111110",
410	=>"01011101",
411	=>"11100010",
412	=>"00001100",
413	=>"11110010",
414	=>"00000101",
415	=>"11110110",
416	=>"00000010",
417	=>"11111000",
418	=>"00000000",
419	=>"11111001",
420	=>"00000000",
421	=>"11111010",
422	=>"11111111",
423	=>"11111011",
424	=>"11111110",
425	=>"11111011",
426	=>"11111110",
427	=>"11111011",
428	=>"11111110",
429	=>"11111100",
430	=>"11111101",
431	=>"11111100",
432	=>"11111101",
433	=>"11111100",
434	=>"11111101",
435	=>"11111100",
436	=>"11111101",
437	=>"11111100",
438	=>"11111101",
439	=>"11111101",
440	=>"11111100",
441	=>"11111101",
442	=>"11111100",
443	=>"11111101",
444	=>"11111100",
445	=>"11111101",
446	=>"11111100",
447	=>"11111101",
448	=>"11111100",
449	=>"11111101",
450	=>"11111100",
451	=>"11111101",
452	=>"11111100",
453	=>"11111101",
454	=>"11111100",
455	=>"11111101",
456	=>"11111100",
457	=>"11111101",
458	=>"11111011",
459	=>"11111101",
460	=>"11111011",
461	=>"11111101",
462	=>"11111011",
463	=>"11111101",
464	=>"11111011",
465	=>"11111101",
466	=>"11111011",
467	=>"11111110",
468	=>"11111011",
469	=>"11111110",
470	=>"11111011",
471	=>"11111110",
472	=>"11111011",
473	=>"11111110",
474	=>"11111011",
475	=>"11111110",
476	=>"11111011",
477	=>"11111110",
478	=>"11111011",
479	=>"11111110",
480	=>"11111011",
481	=>"11111110",
482	=>"11111011",
483	=>"11111110",
484	=>"11111011",
485	=>"11111110",
486	=>"11111011",
487	=>"11111110",
488	=>"11111011",
489	=>"11111110",
490	=>"11111011",
491	=>"11111110",
492	=>"11111011",
493	=>"11111110",
494	=>"11111011",
495	=>"11111110",
496	=>"11111011",
497	=>"11111110",
498	=>"11111011",
499	=>"11111110",
500	=>"11111011",
501	=>"11111110",
502	=>"11111011",
503	=>"11111110",
504	=>"11111011",
505	=>"11111110",
506	=>"11111011",
507	=>"11111110",
508	=>"11111011",
509	=>"11111110",
510	=>"11111011",
511	=>"11111110",
512	=>"01111010",
513	=>"11111110",
514	=>"11111011",
515	=>"11111110",
516	=>"11111011",
517	=>"11111110",
518	=>"11111011",
519	=>"11111110",
520	=>"11111011",
521	=>"11111110",
522	=>"11111011",
523	=>"11111110",
524	=>"11111011",
525	=>"11111110",
526	=>"11111011",
527	=>"11111110",
528	=>"11111011",
529	=>"11111110",
530	=>"11111011",
531	=>"11111110",
532	=>"11111011",
533	=>"11111110",
534	=>"11111011",
535	=>"11111110",
536	=>"11111011",
537	=>"11111110",
538	=>"11111011",
539	=>"11111110",
540	=>"11111011",
541	=>"11111110",
542	=>"11111011",
543	=>"11111110",
544	=>"11111011",
545	=>"11111110",
546	=>"11111011",
547	=>"11111110",
548	=>"11111011",
549	=>"11111110",
550	=>"11111011",
551	=>"11111110",
552	=>"11111011",
553	=>"11111110",
554	=>"11111011",
555	=>"11111110",
556	=>"11111011",
557	=>"11111110",
558	=>"11111011",
559	=>"11111101",
560	=>"11111011",
561	=>"11111101",
562	=>"11111011",
563	=>"11111101",
564	=>"11111011",
565	=>"11111101",
566	=>"11111011",
567	=>"11111101",
568	=>"11111100",
569	=>"11111101",
570	=>"11111100",
571	=>"11111101",
572	=>"11111100",
573	=>"11111101",
574	=>"11111100",
575	=>"11111101",
576	=>"11111100",
577	=>"11111101",
578	=>"11111100",
579	=>"11111101",
580	=>"11111100",
581	=>"11111101",
582	=>"11111100",
583	=>"11111101",
584	=>"11111100",
585	=>"11111101",
586	=>"11111101",
587	=>"11111100",
588	=>"11111101",
589	=>"11111100",
590	=>"11111101",
591	=>"11111100",
592	=>"11111101",
593	=>"11111100",
594	=>"11111101",
595	=>"11111100",
596	=>"11111110",
597	=>"11111011",
598	=>"11111110",
599	=>"11111011",
600	=>"11111110",
601	=>"11111011",
602	=>"11111111",
603	=>"11111010",
604	=>"00000000",
605	=>"11111001",
606	=>"00000000",
607	=>"11111000",
608	=>"00000010",
609	=>"11110110",
610	=>"00000101",
611	=>"11110010",
612	=>"00001100",
613	=>"11100010",
614	=>"01011101",
615	=>"00111110",
616	=>"11100100",
617	=>"00001100",
618	=>"11110010",
619	=>"00000110",
620	=>"11110110",
621	=>"00000011",
622	=>"11110111",
623	=>"00000010",
624	=>"11111001",
625	=>"00000001",
626	=>"11111001",
627	=>"00000000",
628	=>"11111010",
629	=>"00000000",
630	=>"11111010",
631	=>"11111111",
632	=>"11111011",
633	=>"11111111",
634	=>"11111011",
635	=>"11111111",
636	=>"11111011",
637	=>"11111111",
638	=>"11111100",
639	=>"11111110",
640	=>"11111100",
641	=>"11111110",
642	=>"11111100",
643	=>"11111110",
644	=>"11111100",
645	=>"11111110",
646	=>"11111100",
647	=>"11111110",
648	=>"11111100",
649	=>"11111110",
650	=>"11111101",
651	=>"11111110",
652	=>"11111101",
653	=>"11111101",
654	=>"11111101",
655	=>"11111101",
656	=>"11111101",
657	=>"11111101",
658	=>"11111101",
659	=>"11111101",
660	=>"11111101",
661	=>"11111101",
662	=>"11111101",
663	=>"11111101",
664	=>"11111110",
665	=>"11111101",
666	=>"11111110",
667	=>"11111101",
668	=>"11111110",
669	=>"11111101",
670	=>"11111110",
671	=>"11111101",
672	=>"11111110",
673	=>"11111101",
674	=>"11111110",
675	=>"11111101",
676	=>"11111110",
677	=>"11111100",
678	=>"11111110",
679	=>"11111100",
680	=>"11111111",
681	=>"11111100",
682	=>"11111111",
683	=>"11111100",
684	=>"11111111",
685	=>"11111100",
686	=>"11111111",
687	=>"11111100",
688	=>"11111111",
689	=>"11111100",
690	=>"11111111",
691	=>"11111100",
692	=>"11111111",
693	=>"11111100",
694	=>"00000000",
695	=>"11111100",
696	=>"00000000",
697	=>"11111100",
698	=>"00000000",
699	=>"11111011",
700	=>"00000000",
701	=>"11111011",
702	=>"00000000",
703	=>"11111011",
704	=>"00000001",
705	=>"11111011",
706	=>"00000001",
707	=>"11111010",
708	=>"00000010",
709	=>"11111010",
710	=>"00000011",
711	=>"11111000",
712	=>"00000100",
713	=>"11110110",
714	=>"00001000",
715	=>"11101111",
716	=>"00011101",
717	=>"01110100",
718	=>"11101100",
719	=>"00000111",
720	=>"11111000",
721	=>"00000010",
722	=>"11111011",
723	=>"00000000",
724	=>"11111100",
725	=>"11111111",
726	=>"11111101",
727	=>"11111111",
728	=>"11111110",
729	=>"11111111",
730	=>"11111110",
731	=>"11111110",
732	=>"11111110",
733	=>"11111110",
734	=>"11111111",
735	=>"11111110",
736	=>"11111111",
737	=>"11111110",
738	=>"11111111",
739	=>"11111110",
740	=>"11111111",
741	=>"11111110",
742	=>"11111111",
743	=>"11111110",
744	=>"11111111",
745	=>"11111110",
746	=>"11111111",
747	=>"11111101",
748	=>"11111111",
749	=>"11111101",
750	=>"00000000",
751	=>"11111101",
752	=>"00000000",
753	=>"11111101",
754	=>"00000000",
755	=>"11111101",
756	=>"00000000",
757	=>"11111101",
758	=>"00000000",
759	=>"11111101",
760	=>"00000000",
761	=>"11111101",
762	=>"00000000",
763	=>"11111101",
764	=>"00000000",
765	=>"11111101",
766	=>"00000000",
767	=>"11111101",
768	=>"00000000",
769	=>"11111110",
770	=>"00000000",
771	=>"11111110",
772	=>"00000000",
773	=>"11111110",
774	=>"00000000",
775	=>"11111110",
776	=>"00000000",
777	=>"11111110",
778	=>"00000000",
779	=>"11111110",
780	=>"00000000",
781	=>"11111110",
782	=>"00000000",
783	=>"11111110",
784	=>"00000000",
785	=>"11111110",
786	=>"00000000",
787	=>"11111110",
788	=>"00000000",
789	=>"11111110",
790	=>"00000000",
791	=>"11111110",
792	=>"00000000",
793	=>"11111110",
794	=>"00000000",
795	=>"11111110",
796	=>"00000000",
797	=>"11111111",
798	=>"00000000",
799	=>"11111111",
800	=>"00000000",
801	=>"11111111",
802	=>"00000000",
803	=>"11111111",
804	=>"11111111",
805	=>"11111111",
806	=>"11111111",
807	=>"00000000",
808	=>"11111111",
809	=>"00000000",
810	=>"11111110",
811	=>"00000001",
812	=>"11111110",
813	=>"00000010",
814	=>"11111100",
815	=>"00000100",
816	=>"11111001",
817	=>"00001001",
818	=>"11101101",
819	=>"01110101",
820	=>"00011111",
821	=>"11110001",
822	=>"00001001",
823	=>"11111000",
824	=>"00000110",
825	=>"11111010",
826	=>"00000100",
827	=>"11111011",
828	=>"00000100",
829	=>"11111100",
830	=>"00000011",
831	=>"11111101",
832	=>"00000011",
833	=>"11111101",
834	=>"00000010",
835	=>"11111101",
836	=>"00000010",
837	=>"11111101",
838	=>"00000010",
839	=>"11111110",
840	=>"00000010",
841	=>"11111110",
842	=>"00000010",
843	=>"11111110",
844	=>"00000010",
845	=>"11111110",
846	=>"00000010",
847	=>"11111110",
848	=>"00000001",
849	=>"11111110",
850	=>"00000001",
851	=>"11111111",
852	=>"00000001",
853	=>"11111111",
854	=>"00000001",
855	=>"11111111",
856	=>"00000001",
857	=>"11111111",
858	=>"00000001",
859	=>"11111111",
860	=>"00000001",
861	=>"11111111",
862	=>"00000001",
863	=>"11111111",
864	=>"00000001",
865	=>"11111111",
866	=>"00000001",
867	=>"00000000",
868	=>"00000001",
869	=>"00000000",
870	=>"00000001",
871	=>"00000000",
872	=>"00000001",
873	=>"00000000",
874	=>"00000000",
875	=>"00000000",
876	=>"00000000",
877	=>"00000000",
878	=>"00000000",
879	=>"00000000",
880	=>"00000000",
881	=>"00000001",
882	=>"00000000",
883	=>"00000001",
884	=>"00000000",
885	=>"00000001",
886	=>"00000000",
887	=>"00000001",
888	=>"00000000",
889	=>"00000001",
890	=>"00000000",
891	=>"00000001",
892	=>"00000000",
893	=>"00000001",
894	=>"11111111",
895	=>"00000010",
896	=>"11111111",
897	=>"00000010",
898	=>"11111111",
899	=>"00000010",
900	=>"11111111",
901	=>"00000010",
902	=>"11111111",
903	=>"00000011",
904	=>"11111110",
905	=>"00000011",
906	=>"11111110",
907	=>"00000011",
908	=>"11111110",
909	=>"00000100",
910	=>"11111101",
911	=>"00000101",
912	=>"11111100",
913	=>"00000101",
914	=>"11111011",
915	=>"00000111",
916	=>"11111001",
917	=>"00001010",
918	=>"11110110",
919	=>"00010000",
920	=>"11101000",
921	=>"01000010",
922	=>"01100001",
923	=>"11100110",
924	=>"00010000",
925	=>"11110110",
926	=>"00001001",
927	=>"11111010",
928	=>"00000110",
929	=>"11111100",
930	=>"00000101",
931	=>"11111110",
932	=>"00000100",
933	=>"11111110",
934	=>"00000011",
935	=>"11111111",
936	=>"00000011",
937	=>"11111111",
938	=>"00000010",
939	=>"00000000",
940	=>"00000010",
941	=>"00000000",
942	=>"00000010",
943	=>"00000000",
944	=>"00000010",
945	=>"00000000",
946	=>"00000001",
947	=>"00000001",
948	=>"00000001",
949	=>"00000001",
950	=>"00000001",
951	=>"00000001",
952	=>"00000001",
953	=>"00000001",
954	=>"00000001",
955	=>"00000001",
956	=>"00000001",
957	=>"00000001",
958	=>"00000001",
959	=>"00000010",
960	=>"00000001",
961	=>"00000010",
962	=>"00000000",
963	=>"00000010",
964	=>"00000000",
965	=>"00000010",
966	=>"00000000",
967	=>"00000010",
968	=>"00000000",
969	=>"00000010",
970	=>"00000000",
971	=>"00000010",
972	=>"00000000",
973	=>"00000010",
974	=>"00000000",
975	=>"00000010",
976	=>"00000000",
977	=>"00000010",
978	=>"00000000",
979	=>"00000010",
980	=>"00000000",
981	=>"00000010",
982	=>"00000000",
983	=>"00000010",
984	=>"00000000",
985	=>"00000011",
986	=>"00000000",
987	=>"00000011",
988	=>"00000000",
989	=>"00000011",
990	=>"00000000",
991	=>"00000011",
992	=>"00000000",
993	=>"00000011",
994	=>"00000000",
995	=>"00000011",
996	=>"00000000",
997	=>"00000011",
998	=>"00000000",
999	=>"00000011",
1000	=>"00000000",
1001	=>"00000011",
1002	=>"00000000",
1003	=>"00000011",
1004	=>"00000000",
1005	=>"00000011",
1006	=>"00000000",
1007	=>"00000011",
1008	=>"00000000",
1009	=>"00000011",
1010	=>"00000000",
1011	=>"00000011",
1012	=>"00000000",
1013	=>"00000011",
1014	=>"00000000",
1015	=>"00000011",
1016	=>"00000000",
1017	=>"00000011",
1018	=>"00000000",
1019	=>"00000011",
1020	=>"00000000",
1021	=>"00000011",
1022	=>"00000000",
1023	=>"00000011");




begin

	SignalFromLookUp_process: process(clk, reset) 
	variable counter : integer range 0 to 2048 := 0;
	begin
		if(reset='0') then
			counter:=0;
		elsif(rising_edge(clk)) then 
		counter:=counter+CounterIncrease;
		
			if(counter>=1024) then
				counter:=counter-1024; --Fixme make sure that the counter is set not only to 0 but to the corerct overflow, counter should be a variable in order to change directly otehrwise it can happen that the overflow happens before the ounter is resettet to 0
			end if;
			
			--Minus sin(x);
			wave_out<=std_logic_vector(SignalFromLookUp_array(counter));

	
		
		end if;
	end process SignalFromLookUp_process;
		
end rtl;
