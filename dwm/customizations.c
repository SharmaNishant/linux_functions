/** Function to shift the current view to the left/right
 *
 * @param: "arg->i" stores the number of tags to shift right (positive value)
 *          or left (negative value)
 */
void
shiftview(const Arg *arg) {
    Arg shifted;

    if(arg->i > 0) // left circular shift
        shifted.ui = (selmon->tagset[selmon->seltags] << arg->i)
           | (selmon->tagset[selmon->seltags] >> (LENGTH(tags) - arg->i));

    else // right circular shift
        shifted.ui = selmon->tagset[selmon->seltags] >> (- arg->i)
           | selmon->tagset[selmon->seltags] << (LENGTH(tags) + arg->i);

    view(&shifted);
}

/** Function to shift the current focus and view to the left/right
 *
 * @param: "arg->i" stores the number of tags to shift right (positive value)
 *          or left (negative value)
 */
void
shifttagview(const Arg *arg) {
    if(selmon->sel == NULL
    || __builtin_popcount(selmon->tagset[selmon->seltags] & TAGMASK) != 1)
        return;

    if(arg->i > 0) // left circular shift
        selmon->sel->tags = (selmon->sel->tags << arg->i)
           | (selmon->sel->tags >> (LENGTH(tags) - arg->i));

    else // right circular shift
        selmon->sel->tags = selmon->sel->tags >> (- arg->i)
           | selmon->sel->tags << (LENGTH(tags) + arg->i);

    shiftview(arg);
}

