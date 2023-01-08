/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
let isAnagram = function(s, t) {
    return s.split('').sort().join('') === t.split('').sort().join('');
};