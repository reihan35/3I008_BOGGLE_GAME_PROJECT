open Boggle
(*
let main () =
  if Array.length Sys.argv >= 2
  then begin
    print_string "J'ai reçu le paramètre ";
    print_endline Sys.argv.(1);
  end
  else begin
    print_endline "Je n'ai reçu aucun paramètre"
  end;
  print_endline "Je ne sais pas quoi faire... Programmez moi !"
*)

let main () =
  print_string "***********************************************************************************\n";
  print_string "Welcome to the Boggle Game !! Here's a Boggle generated for you ! Try to solve it by your own\n";
  let random_letter_fr = RandomLetter.picker RandomLetter.Distribution.fr in
  let board = Board.make 4 random_letter_fr
  in
  Board.print board;
  print_string "\n";
  print_string "\nOr tap enter to see the solutions if you are lazy !\n";
  read_line();
  print_string "Here's your Boggle's solutions :\n";
  let dict = Lexicon.load_file "dict/dico_fr.txt" in
  match dict with
  |None->print_string "problem";
  |Some d->
    Iter.iter (fun x -> print_string (x^" ")) (Path.iter_to_words board (Solver.find_all_paths board d));;

	(*let board = Board.from_string "abcd" in
    match board with
    | None -> print_string("Désolées pas carré")
    | Some(t) -> Board.print t;
                 let p = Path.add_tile t Path.empty (0,0) in
                 match p with
                  |Some a->print_string (Path.to_string t a);
                  |None->print_string( Path.to_string t Path.empty);;*)

	(*let l = Lexicon.empty in
	if Lexicon.is_empty l then print_string "vide\n" else print_string "non vide";
	let a = Lexicon.add l "hugo" in
  let b = Lexicon.add a "wyborska" in
  let d = Lexicon.add b "wyb" in
  let c = Lexicon.add d "wyborskal" in
  let t = Lexicon.letter_suffixes c 'y' in
  let t_s = Lexicon.to_iter t in*)


  (*match open_in "dict/dico_fr_petit.txt" with
  | channel -> print_string "works"
  | exception Sys_error _ -> print_string "does not work";;


  let v = Lexicon.load_file "dict/dico_fr.txt" in
  match v with
  |Some a->
        print_string "voici la liste des mots de length 16 et plus\n";
        let e = Lexicon.filter_min_length 16 a in
        Iter.iter (fun x -> print_string(x^" ")) (Lexicon.to_iter e);
        print_string "\n";
        let z = Lexicon.letter_suffixes a 'w' in
        print_string "voici la liste des mots qui start par w sans le w ! \n";
        Iter.iter (fun x -> print_string(x^" ")) (Lexicon.to_iter z);
  |None->print_string "problem";;*)


(*if Lexicon.has_empty_word c then print_string "il y a le mot vide\n" else print_string "il n'y a pas le mot vide";;*)
	(*let s = Lexicon.to_iter c in*)
  (*if Lexicon.is_empty a then print_string "vide\n" else print_string "non vide";;*)
	(*Iter.iter (fun x -> print_string(x^" ")) s;*)
  (*Iter.iter (fun x -> print_string(x^" ")) t_s;;*)

let () = main ()
