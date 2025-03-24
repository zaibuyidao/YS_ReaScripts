-- @description insert NRPN 手动
-- @version 1.0
-- @author YS
-- @changelog New Script
-- @provides [main=midi_editor,midi_eventlisteditor] .

local num = reaper.GetCursorPositionEx(0)

local editor = reaper.MIDIEditor_GetActive()

local take = reaper.MIDIEditor_GetTake(editor)

startpos = reaper.MIDI_GetPPQPosFromProjTime(take, num)

evtidx = 0
evt_tb = {}
retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)
while retval do
    table.insert(evt_tb, ppqpos)
    evtidx = evtidx + 1
    retval, selected, muted, ppqpos, msg = reaper.MIDI_GetEvt(take, evtidx)
end
item = reaper.GetMediaItemTake_Item(take)
itempos = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
itemlength = reaper.GetMediaItemInfo_Value(item, 'D_LENGTH')
itemend = itempos + itemlength
endppq = reaper.MIDI_GetPPQPosFromProjTime(take, itemend)
table.insert(evt_tb, endppq)

for i, v in ipairs(evt_tb) do
    if v > startpos then
        juli = v - startpos
        if juli < 25 then
            reaper.MB('插入间隔不足！', '提醒', 0)
            reaper.SN_FocusMIDIEditor()
            return
        else
            juli = (juli - 10) / 20
            numNRPN, xiaoshu = math.modf(juli)
        end
        break
    end
end
insertppq = startpos
if numNRPN > 25 then
    numNRPN = 25
end
a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z = -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1
a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, k1, l1, m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w1, x1, y1, z1 = -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
list1 = {a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z}
list2 = {a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, k1, l1, m1, n1, o1, p1, q1, r1, s1, t1, u1, v1, w1, x1, y1, z1}
getinput = {}

local ctx = reaper.ImGui_CreateContext('My script')
local font = reaper.ImGui_CreateFont('sans-serif', 14)
reaper.ImGui_Attach(ctx, font)
windows_flag = reaper.ImGui_WindowFlags_TopMost()
windows_flag = windows_flag | reaper.ImGui_WindowFlags_AlwaysAutoResize()
flag = true

is_first_appearance = true
function loop()
    editor = reaper.MIDIEditor_GetActive()
    if not editor then
        flag = false
    end
    reaper.ImGui_PushFont(ctx, font)
    local visible, open = reaper.ImGui_Begin(ctx, 'Insert NRPN', true, windows_flag)
    if visible then
        reaper.ImGui_TextColored(ctx, 0xFA8072FF, '   CC98                   CC6')
        for var = 1, numNRPN do
            reaper.ImGui_PushID(ctx, var)
            if is_first_appearance and var == 1 then
                reaper.ImGui_SetKeyboardFocusHere(ctx, 0)
                is_first_appearance = false -- 关闭标志
            end
            reaper.ImGui_SetNextItemWidth(ctx, 150)
            retval, list1[var], list2[var] = reaper.ImGui_InputInt2(ctx, var, list1[var], list2[var])

            if list1[var] < -1 then
                list1[var] = -1
            end
            if list2[var] < -1 then
                list2[var] = -1
            end
            if list1[var] > 127 then
                list1[var] = 127
            end
            if list2[var] > 127 then
                list2[var] = 127
            end
            getinput[var] = list1[var] .. ',' .. list2[var]
            reaper.ImGui_PopID(ctx)
        end
        Key_Escape = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Escape())
        if reaper.ImGui_Button(ctx, 'Cancel', 70, 0) or Key_Escape then
            flag = false
        end
        reaper.ImGui_SameLine(ctx)
        Key_Enter = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_Enter())
        KeypadEnter = reaper.ImGui_IsKeyPressed(ctx, reaper.ImGui_Key_KeypadEnter())
        if reaper.ImGui_Button(ctx, 'Ok', 70, 0) or Key_Enter or KeypadEnter then
            reaper.PreventUIRefresh(1)
            for i, v in ipairs(getinput) do
                cc98, cc6 = string.match(v, "(.+),(.+)")
                cc98 = tonumber(cc98)
                cc6 = tonumber(cc6)
                if cc98 ~= -1 and cc6 ~= -1 then
                    insertppq = insertppq + 20
                    reaper.MIDI_InsertCC(take, false, false, insertppq - 10, 176, 0, 98, cc98)
                    reaper.MIDI_InsertCC(take, false, false, insertppq, 176, 0, 6, cc6)
                end
            end
            reaper.MIDI_Sort(take)
            reaper.PreventUIRefresh(-1)
            flag = false
        end

        reaper.ImGui_End(ctx)

    end
    reaper.ImGui_PopFont(ctx)

    if open and flag then
        reaper.defer(loop)
    else
        reaper.SN_FocusMIDIEditor()
    end
end

reaper.defer(loop)

