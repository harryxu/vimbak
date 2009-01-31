if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet for for(".st."init".et."; ".st."condition".et."; ".st."operation".et.") {\<CR>".st.et."<CR>}"

exec "Snippet if if(".st."condition".et.") {\<CR>".st.et."<CR>}"

let fn = "function ".st."name".et."(".st."params".et."):".st."type".et." {\<CR>".st.et."<CR>}"
exec "Snippet fn ".st.et." ".fn
exec "Snippet sfn ".st.et." static ".fn
exec "Snippet ofn override ".st.et." ".fn

exec "Snippet class ".st.et." class ".st."name".et." {\<CR>".st.et."<CR>}"
exec "Snippet classe ".st.et." class ".st."name".et." extends ".st."extends".et." {\<CR>".st.et."<CR>}"
exec "Snippet classi ".st.et." class ".st."name".et." implements ".st."implements".et." {\<CR>".st.et."<CR>}"
exec "Snippet classei ".st.et." class ".st."name".et." extends ".st."extends".et." implements ".st."implements".et." {\<CR>".st.et."<CR>}"
